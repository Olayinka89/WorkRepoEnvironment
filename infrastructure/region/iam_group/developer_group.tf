module "developer" {
    source = "../../..//modules/group"

    group_name = "developer"
    region      = "us-east-1"
    policy_name = "developer-cloudengineer-managed-policy"
    policy_description = "cloudengineer-developer-inline_policies"
    inline_policy_to_attach = data.aws_iam_policy_document.developer_inline_policy.json
    managed_policies_to_attach = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
        ]
}

data "aws_iam_policy_document" "developer_inline_policy" {
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
            "*",
            "s3:*"
        ]
        resources = [
            "*",
            ]
    }
}