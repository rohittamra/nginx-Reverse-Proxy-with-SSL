az login —-> get the subscription id which will be needed for next step

az ad sp create-for-rbac --name "linux-tweet-terraform" \
    --role="Contributor" \
    --scopes="/subscriptions/<subscription id>" \
    --sdk-auth
