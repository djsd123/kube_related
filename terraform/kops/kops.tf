resource "aws_iam_user" "kops_user" {
  name = "${var.kops_user}"
}

resource "aws_iam_role" "kops_bootstrap_role" {
  name = "${var.kops_bootstrap_role}"
  assume_role_policy = <<EOP
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOP
}

resource "aws_iam_role_policy" "kops_bootstrap_policy" {
  name = "kops_bootstrap_policy"
  role = "${var.kops_bootstrap_role}"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [{
			"Effect": "Allow",
			"Action": "iam:*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"route53:*",
				"route53domains:*",
				"cloudfront:ListDistributions",
				"elasticloadbalancing:DescribeLoadBalancers",
				"elasticbeanstalk:DescribeEnvironments",
				"s3:ListBucket",
				"s3:GetBucketLocation",
				"s3:GetBucketWebsiteConfiguration",
				"ec2:DescribeVpcs",
				"ec2:DescribeRegions",
				"sns:ListTopics",
				"sns:ListSubscriptionsByTopic",
				"cloudwatch:DescribeAlarms",
				"cloudwatch:GetMetricStatistics"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "elasticloadbalancing:*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "cloudwatch:*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "autoscaling:*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "s3:*",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "ec2:*",
			"Resource": "*"
		}
	]
}
EOF
}

terraform {
  backend "s3" {
    bucket = "plat1.kube.mcallison.uk"
    key    = "kops/tfstate"
  }
}
