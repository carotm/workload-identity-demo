# workload-identity-demo

Demo with workload identity setup, it will create:
* a `demo-workload-identity` GKE with workload identity enabled
* a bucket with an image 
* a `gcloud-sa` SA with access to the bucket created
* Inside the GKE:
  * a `demo` namespace 
  * a `k8s_sa` with the annotations to be binded with `gcloud-sa`
* the iam policy to bind the `gcloud-sa` with the service account created in kubernetes

To create infrastructure
```shell
$ terraform init
$ terraform plan -out plan.out
$ terraform apply plan.out
```

Then, get the credentials from the GKE 
```shell
$ gcloud container clusters get-credentials demo-workload-identity --zone=us-east4-c \
--project=emerald-metrics-274919
```

Create a demo pod
```shell
kubectl run -it \
  --image google/cloud-sdk \
  --serviceaccount gke-sa \
  --namespace demo \
  workload-identity-test
```

Once the pod is created test if you can see 
```shell
kubectl run -it \
  --image google/cloud-sdk \
  --serviceaccount gke-sa \
  --namespace demo \
  workload-identity-test
```

