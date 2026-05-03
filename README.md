# Terminal-Bench Core 0.1.1 Hostnet Adaptation

This directory is a network-adapted copy of Terminal-Bench Core 0.1.1.
The clean original dataset was not modified.

Use this dataset explicitly:

```bash
tb run --dataset-path /Users/havx/Documents/terminal-bench/terminal-bench-core-0.1.1-hostnet ...
```

## What Changed

- Added `network_mode: host` to selected single-container tasks that need public network access.
- Kept multi-container tasks on Docker bridge networking when the client depends on service names such as `api:8000`, `server:8000`, or `node1:9000`.
- Switched Debian/Ubuntu apt sources in Dockerfiles to Tsinghua mirrors where apt installs are used.
- Routed ordinary PyPI installs through `https://pypi.tuna.tsinghua.edu.cn/simple`.
- Preserved special package indexes such as PyTorch CPU wheels.
- Localized several fixed external resources into `task-deps/` and updated Dockerfiles or solutions to use local files.

## Host Network Tasks

`network_mode: host` was added to 40 tasks:

`build-initramfs-qemu`, `build-linux-kernel-qemu`, `build-tcc-qemu`, `cartpole-rl-training`, `conda-env-conflict-resolution`, `count-dataset-tokens`, `crack-7z-hash`, `crack-7z-hash.easy`, `crack-7z-hash.hard`, `csv-to-parquet`, `download-youtube`, `eval-mteb`, `eval-mteb.hard`, `extract-moves-from-video`, `fibonacci-server`, `fix-git`, `get-bitcoin-nodes`, `gpt2-codegolf`, `hf-model-inference`, `incompatible-python-fasttext`, `incompatible-python-fasttext.base_with_hint`, `oom`, `play-zork`, `pytorch-model-cli`, `pytorch-model-cli.easy`, `pytorch-model-cli.hard`, `qemu-alpine-ssh`, `qemu-startup`, `reshard-c4-data`, `run-pdp11-code`, `sanitize-git-repo`, `sanitize-git-repo.hard`, `solana-data`, `sqlite-with-gcov`, `super-benchmark-upet`, `swe-bench-astropy-1`, `swe-bench-astropy-2`, `swe-bench-fsspec`, `swe-bench-langcodes`, `train-fasttext`.

## Localized Resources

Resources copied into `task-deps/` include:

- `super-benchmark-upet`: spaCy wheel and fixed UPET source tarball
- `download-youtube`: `yt-dlp`
- `incompatible-python-fasttext*`: HuggingFace `model.bin`
- `sanitize-git-repo*`, `fix-git`, `train-fasttext`: Git repository snapshots
- `crack-7z-hash*`: John the Ripper source snapshot
- `swe-bench-astropy-1/2`, `swe-bench-fsspec`, `swe-bench-langcodes`: fixed commit source tarballs
- `build-initramfs-qemu`, `build-linux-kernel-qemu`, `build-tcc-qemu`: Linux 6.9 tarball and busybox binary

## Not Fully Offline

Some tasks still depend on live public services or large external assets:

`download-youtube`, `extract-moves-from-video`, `get-bitcoin-nodes`, `solana-data`, `count-dataset-tokens`, `oom`, `hf-model-inference`, `train-fasttext`, `gpt2-codegolf`, `qemu-alpine-ssh`, `qemu-startup`, `run-pdp11-code`, `build-tcc-qemu`, `play-zork`, `sqlite-with-gcov`, `eval-mteb`, `eval-mteb.hard`, `super-benchmark-upet`.

For QEMU Alpine tasks, the Alpine ISO URL was switched to the Tsinghua Alpine mirror instead of being downloaded locally.

## Multi-Container Tasks Kept on Bridge Networking

These tasks were intentionally not given host networking:

- `simple-sheets-put`: client uses `api:8000` and database service names.
- `simple-web-scraper`: client uses `server:8000`.
- `security-vulhub-minio`: MinIO nodes use `node1`, `node2`, and `node3` service names.

## Verification

- Task directory count: 80
- `docker compose config`: passed for all 80 tasks
- `super-benchmark-upet` local dependencies were checked
- `super-benchmark-upet` Docker build could not be completed because the local Docker daemon was not reachable
