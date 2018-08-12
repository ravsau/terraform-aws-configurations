variable "bucketName"{
}

resource "aws_s3_bucket" "newbucket" {
  bucket = "${var.bucketName}"
  acl    = "private"
  
  
  # remove the below line if you don't want versioning
  versioning {
    enabled = true
  }
   tags {
    Name        = "${timestamp()}"
    Environment = "Dev"
  }
}



resource "aws_s3_bucket_object" "object" {
  # .bucket references the bucket name below
  bucket =  "${aws_s3_bucket.newbucket.bucket}"
  key    = "file.txt"
  # replace with a file path on your machine
  source = "~/self-cf.yml"
  etag   = "${md5(file("~/self-cf.yml"))}"
}
