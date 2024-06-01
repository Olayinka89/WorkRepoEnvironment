module "it_engineer" {
    source = "../../..//modules/group"

    group_name = "it_engineer"
    region      = "us-east-1"
    policy_name = "it_engineer-cloudengineer-managed-policy"
    policy_description = "cloudengineer-it_engineer-inline_policies"
    inline_policy_to_attach = data.aws_iam_policy_document.it_engineer_inline_policy.json
    managed_policies_to_attach = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
        ]
}

data "aws_iam_policy_document" "it_engineer_inline_policy" {
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
            
        ]
        resources = [
            "*",
            ]
    }
}