resource "aws_iam_policy" "ec2_policy" {
  name        = "${var.profile_name}-ec2-policy"
  path        = "/"
  description = "Policy to provice permission to EC2"

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "VisualEditor0",
        Effect : "Allow",
        Action : [
          "iam:CreateInstanceProfile",
          "iam:GetRole",
          "iam:GetInstanceProfile",
          "iam:TagRole",
          "iam:CreateRole",
          "iam:DeleteRole",
          "iam:AttachRolePolicy",
          "iam:ListInstanceProfileTags",
          "iam:PutRolePolicy",
          "iam:ListInstanceProfiles",
          "iam:AddRoleToInstanceProfile",
          "iam:CreatePolicy",
          "iam:ListInstanceProfilesForRole",
          "iam:PassRole",
          "iam:DetachRolePolicy",
          "iam:ListAttachedRolePolicies",
          "iam:DeleteRolePolicy",
          "iam:ListRolePolicies",
          "iam:GetRolePolicy",
          "iam:TagInstanceProfile",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:ListPolicyVersions",
          "iam:DeletePolicy"
        ],
        Resource : [
          "arn:aws:iam::682754566499:policy/*",
          "arn:aws:iam::682754566499:role/*",
          "arn:aws:iam::682754566499:instance-profile/*"
        ]
      }
    ]
  })
}