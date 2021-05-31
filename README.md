# Convert HoVerNet TensorFlow checkpoints to NumPy NPZ files

# Convert using Docker

## Build the Docker image

Use the command below to build the Docker image.

```
docker build --tag hovernet-tf-npz-converter .
```

## Run the Docker image on a directory containing TensorFlow checkpoints

The checkpoint directory should contain a graph meta file and an index file. It is
possible that other files will work too, but this is the only setup that has been
tested here.

```
checkpoints/
├── graph-N-X.meta
├── ckpt-X.data-00000-of-00001
└── ckpt-X.index
```

When running the Docker image, be sure to mount your model directory onto the container.
The command below will save the npz file of weights into the same directory that contains
the TensorFlow checkpoints.

```bash
docker run --rm \
    --volume $(realpath checkpoints):/checkpoints \
    hovernet-tf-npz-converter \
        /checkpoints \
        /checkpoints/model-weights.npz
```

# Convert without Docker

Create an environment with `tensorflow==1.12.0` and `tensorpack==0.9.0.1`
(requires `python<=3.6`) and run the script `convert-tf-to-npz.py`.
