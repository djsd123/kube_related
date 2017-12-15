resource "aws_iam_user" "kops_user" {
  name = "${var.kops_bootstrap_user}"
}

resource "aws_iam_group" "kops_bootstrap_group" {
  name = "${var.kops_bootstrap_group}"
}

resource "aws_iam_group_membership" "kops_bootstrap_membership" {
  group = "${aws_iam_group.kops_bootstrap_group.name}"
  name = "${aws_iam_group.kops_bootstrap_group.name}_membership"
  users = [
    "${aws_iam_user.kops_user.name}"
  ]
}

resource "aws_iam_policy_attachment" "kops_bootstrap_policy_attachment" {
  name = "kops_bootstrap_policy_attachment"
  groups = [
    "${aws_iam_group.kops_bootstrap_group.name}"
  ]
  policy_arn = "${aws_iam_policy.kops_bootstrap_policy.arn}"
}
/*
resource "aws_iam_policy_attachment" "assume_role_attachment" {
  name = "assume_role_policy_attachmnet"
  policy_arn = "${aws_iam_policy.assume_role_policy.arn}"
  groups = [
    "${aws_iam_group.kops_bootstrap_group.name}"
  ]
}

resource "aws_iam_policy" "assume_role_policy" {
  name = "assume_role"
  policy = <<EOP
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow"
    }
  ]
}
EOP
}
*/
resource "aws_iam_policy" "kops_bootstrap_policy" {
  name = "policy-${var.kops_bootstrap_group}"

  policy = <<EOP
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Action": [
            "iam:*",
            "route53:*",
            "s3:*",
            "ec2:*"
        ],
        "Resource": "*"
    }
}
EOP
}

/*
terraform {
  backend "s3" {
    bucket = "plat1.kube.mcallison.uk"
    key    = "kops/tfstate"
  }
}
*/
