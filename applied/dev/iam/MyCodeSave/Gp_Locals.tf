locals {
  users = {
    "James"   = "arn:aws:iam::aws:policy/AdministratorAccess"
    "Sarah"   = "arn:aws:iam::aws:policy/job-function/NetworkAdministrator"
    "Paul"    = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    "Promise" = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
}

locals {
  managed_policies = {
    security   = "arn:aws:iam::aws:policy/AdministratorAccess"
    devops     = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    compliance = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }

  inline_policies = {
    security = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "ec2:*",
          "Resource" : "*"
        }
      ]
    })
    devops = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "s3:*",
          "Resource" : "*"
        }
      ]
    })

    compliance = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "CloudTrail:*",
          "Resource" : "*"
        }
      ]
    })
  }
}