## 2025-09-17
TL;DR: rclone instructions for service account out-of-date, can't get key for service account. Can't add permissions for user outside org, 

* Look at project, fuse/buckets
    - `sudo -u accounts zsh` (below assumes user accounts)
    - `gcloud storage buckets list`
    - `gcloud projects list`
    - ---> project id: 947860442207
    - `gcloud projects get-iam-policy 947860442207`
    - `gcloud storage buckets get-iam-policy gs://arborinsight`
* Inspect bucket
    - `gsutil iam get gs://arborinsight`
    - ---> user:accounts@arbor-insight.com
    - `ACCESS_TOKEN=$(gcloud auth print-access-token); curl -s -H "Authorization: Bearer ${ACCESS_TOKEN}" https://storage.googleapis.com/storage/v1/b/arborinsight`
    - (Permission fails) `gcloud storage buckets add-iam-policy-binding  gs://arborinsight --member=user:icos.atropa@gmail.com --role=roles/storage.objectUser`
* Service account
    - `gcloud iam service-accounts create bucket-access`
    - ---> bucket-access@black-rhino-461319-n7.iam.gserviceaccount.com 
    ## (not working) - `gcloud storage buckets add-iam-policy-binding  gs://arborinsight --member=serviceAccount:bucket-access@black-rhino-461319-n7.iam.gserviceaccount.com --role=roles/storage.objectUser`
    - (works) `gcloud storage buckets add-iam-policy-binding  gs://arborinsight --member=serviceAccount:947860442207-compute@developer.gserviceaccount.com --role=roles/storage.objectUser`

* As user xian
    - `rclone config`
    - --> paste in secret token from accounts
    - `rclone lsd gcp.arborinsight:arborinsight/`

* Refs
    - fuse mount-bucket: https://cloud.google.com/storage/docs/cloud-storage-fuse/mount-bucket
    - Principle identifiers: https://cloud.google.com/iam/docs/principal-identifiers
    - Storage roles: https://cloud.google.com/storage/docs/access-control/iam-roles
    - https://cloud.google.com/storage/docs/uniform-bucket-level-access
    - Service accounts / key creation permissions: https://cloud.google.com/iam/docs/keys-create-delete#iam-service-account-keys-create-gcloud
    - rclone remote setup: https://rclone.org/remote_setup/

