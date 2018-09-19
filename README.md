# kubeflow-benchmarks

## TensorFlow on Kubernetes

### Local

- Native and dockerized cnn benchmark (1 GPU)
- Native and dockerized cnn benchmark (2 GPUs)

```bash
$ docker build -t kubeflow/benchmarks .
# Dockerized
$ docker run -v $(pwd):/kubeflow-benchmarks kubeflow/benchmarks ./scripts/single.sh
$ docker run -v $(pwd):/kubeflow-benchmarks kubeflow/benchmarks ./scripts/double.sh
# Native
$ ./scripts/single.sh
$ ./scripts/double.sh
```

### Distributed

#### PS/Worker distribution strategy

- Native and dockerized in one machine
- Native and dockerized in different machines
- Kubernetes default-scheduler vs kube-arbitrator vs ideal-scheduler

#### Mirrored distribution strategy

- Native and dockerized in one machine

#### Collective AllReduce strategy

- Native and dockerized in one machine
- Native and dockerized in different machines
- Kubernetes default-scheduler vs kube-arbitrator vs ideal-scheduler

#### Uber Horovod (Optional)

- Native and dockerized in one machine
- Native and dockerized in different machines
- Kubernetes default-scheduler vs kube-arbitrator vs ideal-scheduler

## PyTorch on Kubernetes

TBA
