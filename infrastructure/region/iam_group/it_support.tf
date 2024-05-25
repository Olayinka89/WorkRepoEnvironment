module "it_support" {
    source = "../../..//modules/group"

    group_name = "it_support"
    region      = "us-east-1"
    policy_name = "it_support-cloudengineer-managed-policy"
    policy_description = "cloudengineer-it_support-inline_policies"
    inline_policy_to_attach = data.aws_iam_policy_document.it_support_inline_policy.json
    managed_policies_to_attach = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
        ]
}

data "aws_iam_policy_document" "it_support_inline_policy" {
    statement {
        sid = ""
        actions = [
            "cloudtrail:*",
            "cloudwatch:*"
        ]
        resources = ["*"]
    }

    statement {
        sid = ""
        actions = [
            "ec2:*",
            "s3:*"
        ]
        resources = ["*"]
    }
}