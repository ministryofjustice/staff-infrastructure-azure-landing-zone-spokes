# staff-infrastructure-azure-landing-zone-spokes

This repository is used to capture the spokes in the azure landing zone

The objective is for each new spoke to create:

- A new Project In Azure DevOps
- A Service Connection for each environment with Contributor Role on the full subscription
- A github repository for the spoke

## Pre-Requisites

- Azure Subscriptions for all needed environments
- Azure Subscriptions must have been assigned to the correct Management Group

## Limitations

It's not possible to add via code the service connection to GitHub, this needs to be done manually.

### GitHub Service Connection

This might seem somewhat convoluted but I'm not 100% how to do it properly, namely adding a service connection seems to add service connection to my personal github account

 1. Once project has been created, navigate to Pipelines
 2. Click _Create Pipeline_
 3. Select Github
 4. Select the repository for this spoke
 5. Follow the menu to completion (I know, cracking instructions)



## Improvements

- Manage project memberships
- Script Github Service Connection