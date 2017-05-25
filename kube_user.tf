resource "aws_iam_user" "kubernetes" {
  name = "kubey"
}

resource "aws_iam_user_policy" "kubernetes_cluster_adm" {
  name = "kube_cluster_adm"
  user = "${aws_iam_user.kubernetes.name}"

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
