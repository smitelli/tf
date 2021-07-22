Terraform
=========

I got tired of hand-editing 120+ DNS records.

by [Scott Smitelli](mailto:scott@smitelli.com)

All you need to know
--------------------

The infrastructure manged here is running on [Linode](https://www.linode.com/). Accordingly, all you need is a valid `LINODE_TOKEN` environment variable and [Terraform CLI](https://www.terraform.io/) v1.0.

The state backend is on [Terraform Cloud](https://app.terraform.io/). All plan/apply operations should be done there, either by interacting with PRs or by configuring the Terraform CLI to operate remotely.
