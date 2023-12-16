

resource "aws_s3_bucket" "proje2blog" {
  bucket = "proje2blog"
}

resource "aws_s3_bucket" "proje2_devopstricks_link" {
  bucket = "proje2.devopstricks.link"
}

resource "aws_s3_bucket_public_access_block" "proje2_devopstricks_link" {
  bucket = aws_s3_bucket.proje2_devopstricks_link.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}



resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.proje2_devopstricks_link.id
  key    = "index.html"
  source = "./s3_Website/index.html"
  acl    = "public"
}



resource "aws_s3_object" "sorry_jpg" {
  bucket = aws_s3_bucket.proje2_devopstricks_link.id
  key    = "sorry.jpg"
  source = "./s3_Website/sorry.jpg"
  acl    = "private"
}

# resource "aws_s3_bucket_policy" "proje2_devopstricks_link_policy" {
#   bucket = aws_s3_bucket.proje2_devopstricks_link.id

#   policy = jsonencode({
#     Version   = "2012-10-17",
#     Statement = [{
#       Effect    = "Allow",
#       Principal = "*",
#       Action    = "s3:GetObject",
#       Resource  = "${aws_s3_bucket.proje2_devopstricks_link.arn}/*",
#       Condition = {
#         StringLike = {
#           "aws:Referer": [
#             "http://devopstricks.link/*",
#             "https://devopstricks.link/*"
#           ]
#         }
#       }
#     }]
#   })
# }

















# resource "aws_s3_bucket" "proje2blog" {
#   bucket = "proje2blog"
#   #acl    = "private"
# }

# resource "aws_s3_bucket" "proje2_devopstricks_link" {
#   bucket = "proje2.devopstricks.link"
#   #acl    = "private"
# }

# resource "aws_s3_object" "index_html" {
#   bucket = aws_s3_bucket.proje2_devopstricks_link.id
#   key    = "index.html"
#   source = "./s3_Website/index.html"
#   acl    = "public-read"
# }

# resource "aws_s3_object" "sorry_jpg" {
#   bucket = aws_s3_bucket.proje2_devopstricks_link.id
#   key    = "sorry.jpg"
#   source = "./s3_Website/sorry.jpg"
#   acl    = "public-read"
# }

# resource "aws_s3_bucket_public_access_block" "proje2_devopstricks_link" {
#   bucket = aws_s3_bucket.proje2_devopstricks_link.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# resource "aws_s3_bucket_policy" "proje2_devopstricks_link_policy" {
#   bucket = aws_s3_bucket.proje2_devopstricks_link.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect    = "Allow",
#       Principal = "*",
#       Action    = "s3:GetObject",
#       Resource  = "${aws_s3_bucket.proje2_devopstricks_link.arn}/*",
#       Condition = {
#         StringLike = {
#           "aws:Referer": ["http://devopstricks.link/*", "https://devopstricks.link/*"]
#         }
#       }
#     }]
#   })
# }



