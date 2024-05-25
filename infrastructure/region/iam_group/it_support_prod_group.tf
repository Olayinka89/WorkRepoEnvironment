module "it_support_prod" {
    source = "../../..//modules/group"

    group_name = "it_support_prod"
    region      = "us-east-1"
    policy_name = "it_support_prod-cloudengineer-managed-policy"
    policy_description = "cloudengineer-it_support_prod-inline_policies"
    inline_policy_to_attach = data.aws_iam_policy_document.it_support_prod_inline_policy.json
    managed_policies_to_attach = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
        ]
}

data "aws_iam_policy_document" "it_support_prod_inline_policy" {
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