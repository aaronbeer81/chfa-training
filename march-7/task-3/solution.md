
1. Get the configtx.yaml:
[Read The Docs](https://hyperledger-fabric.readthedocs.io/en/release-2.2/config_update.html#step-1-pull-and-translate-the-config)
2. decode it and edit the following policies:
[Read The Docs](https://hyperledger-fabric.readthedocs.io/en/release-2.2/create_channel/channel_policies.html?highlight=endorsment%20policies#implicitmeta-policies)
<br> the desired policy is "ALL", which in theory is more secure than a "MAJORITY" policy:
[Read The Docs](https://hyperledger-fabric.readthedocs.io/en/release-2.2/access_control.html#implicitmeta-policies)
