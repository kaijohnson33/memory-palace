#/bin/sh
set -uex Pipefail
owner="africa-prudential"
name="$(pwd | sed 's/.*\/\([a-z-]\)/\1/')"
repositoryId="$(gh api graphql -F name='{repo}' -f query='{repository(owner:"'$owner'",name:"'$name'"){id}}' -q .data.repository.id)"
# Note this takes the first - query again with edges[1] to get the second, etc.
ruleId="$(gh api graphql -f query='{repository(owner:"'$owner'",name:"'$name'"){branchProtectionRules(first:4){edges{node{id}}}}}' -q .data.repository.branchProtectionRules.edges[0].node.id)"
echo $ruleId


# https://docs.github.com/en/graphql/reference/mutations#updatebranchprotectionrule
# https://github.com/cli/cli/issues/3528
# $ruleId:ID! is a declaration
gh api graphql -f query='
mutation($ruleId:ID!) {
  updateBranchProtectionRule(input: {
    branchProtectionRuleId: $ruleId
    dismissesStaleReviews: false
  }) { clientMutationId }
}' -f ruleId="$ruleId" 
