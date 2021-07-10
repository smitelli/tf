Terraform
=========

I got tired of hand-editing 120+ DNS records.

by [Scott Smitelli](mailto:scott@smitelli.com)

All you need to know
--------------------

The infrastructure manged here is running on [Linode](https://www.linode.com/). Accordingly, all you need is a valid `LINODE_TOKEN` environment variable and [Terraform CLI](https://www.terraform.io/) v1.0.

The state backend is the local filesystem. If this is being used on any system other than the one I always run it on... well... best of luck with that.
