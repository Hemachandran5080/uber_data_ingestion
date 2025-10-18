resource "google_storage_bucket" "my_bucket" {
    name     = "uber-data-files"  # Replace with a globally unique bucket name
    location = "US"
    force_destroy = true
}

resource "google_storage_bucket_object" "my_file" {
  name         = "data/uber_data.csv"                    # path/name inside the bucket
  bucket       = google_storage_bucket.my_bucket.name  # uses your existing bucket resource
  source       = "${path.module}/data/uber_data.csv"     # local file path (relative to module)
  content_type = "text/csv"
}

