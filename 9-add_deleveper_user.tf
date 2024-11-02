resource "aws_iam_user" "developer" {
    #When we attacting a user into cluster then we need to take the securrity cred from the aws but not in case of roles in aws 
    name="developer"
  
}
resource "aws_iam_policy" "developer_eks" {
    name = "AWSEKSDeveloperPolicy"
    policy = <<POLICY
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Action": [
                "eks:ListClusters",
                "eks:DescribeCluster"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
   POLICY
  
}

resource "aws_iam_user_policy_attachment" "developer_eks" {
user = aws_iam_user.developer.name
policy_arn = aws_iam_policy.developer_eks.arn
  
}

resource "aws_eks_access_entry" "developer_eks" {
    principal_arn = aws_iam_user.developer.arn
    cluster_name = aws_eks_cluster.eks.name
    kubernetes_groups = ["my-viewer"]
    # This is the only avaibabe process to give acces to the users into the cluster
  #since aws-auth was deprecated
}