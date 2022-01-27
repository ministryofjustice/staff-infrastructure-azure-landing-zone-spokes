# Azure Active Directory Applications

Azure Active Directory Applications are generally used to provide authentication via a service principal for a range of usages

One of our most common usage is to allow a pipeline to manage resources in azure but there are other use cases, e.g. authentication for the likes of grafana or prometheus

This module creates and maintains the app, service principal (enterprise app in the portal) as well as secrets in the AWS SSM.

Note that this module has pretty much been ripped off the [dso-infra-azure-ad repository](https://github.com/ministryofjustice/dso-infra-azure-ad) with as few changes as possible

If you want to store secrets in github, then head over to the repo for details on how that was done.

See [variables file](.variables) for description of some of what the variables do and the [terraform resource](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) for further info.