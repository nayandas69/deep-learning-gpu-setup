# NVIDIA GPU Setup for Deep Learning on Windows

> Set up your Windows system for deep learning with full NVIDIA GPU acceleration.
> This guide walks you through drivers, CUDA, cuDNN, Anaconda, and PyTorch—step-by-step.
> Ideal for researchers, developers, and AI enthusiasts getting started with GPU computing.

## Pre-Flight Checklist

Ensure the following before you begin:

* [x] You're using **Windows 10 or 11**
* [x] Your system includes an **NVIDIA discrete GPU**
* [x] You have **administrator privileges**
* [x] Your system has **at least 8 GB of RAM** (16 GB or more is recommended)
* [x] Your **NVIDIA drivers are fully updated**

## Check GPU and CUDA Compatibility

Before installing CUDA, confirm your current driver and supported CUDA version:

```bash
nvidia-smi
```

> \[!NOTE]
> This command displays your GPU name, current driver version, and the CUDA version supported by your driver.

**Example Output:**

```
CUDA Version: 12.9
GPU Name: NVIDIA GeForce GTX 1650
```

## Install the Latest NVIDIA Driver

Get the latest official driver for your GPU:

**[Download NVIDIA Driver](https://www.nvidia.com/Download/index.aspx)**

> \[!TIP]
> During installation, choose:
>
> * **Custom (Advanced) Installation**
> * Enable **Clean Installation** for a fresh setup

## Install Visual Studio with C++ Support

Required for compiling code with the CUDA Toolkit.

**[Download Visual Studio Community Edition](https://visualstudio.microsoft.com/vs/community/)**

> \[!IMPORTANT]
> On the Workloads selection screen, make sure to enable:
>
> * Desktop development with C++
> * Windows SDK (10.0 or higher)

## Install Anaconda (Python + Package Manager)

Anaconda is essential for managing Python environments and dependencies.

**[Download Anaconda](https://www.anaconda.com/download)**

After installation, open Anaconda Prompt and run:

```bash
conda create -n dl_env python=3.10
conda activate dl_env
```

> \[!TIP]
> Prefer a minimal install? Try **[Miniconda](https://docs.conda.io/en/latest/miniconda.html)** instead.

## Download and Install CUDA Toolkit

Ensure your chosen CUDA version is compatible with your deep learning framework (e.g., PyTorch or TensorFlow).

**[CUDA Toolkit Archive](https://developer.nvidia.com/cuda-toolkit-archive)**

If installing PyTorch with `pytorch-cuda=11.8`, download **CUDA Toolkit 11.8**.

> \[!WARNING]
> Do **not** install CUDA 12.9 unless it is officially supported by your deep learning framework.

### Add CUDA to Environment Path (if needed)

```powershell
setx PATH "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\bin;%PATH%"
```

## Install cuDNN (NVIDIA Deep Neural Network Library)

cuDNN accelerates neural network computations.

**[Download cuDNN](https://developer.nvidia.com/rdp/cudnn-archive)**

Steps:

1. Choose the cuDNN version matching your CUDA version.
2. Extract it into your CUDA folder:

   ```
   C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\
   ```
3. Copy contents into the matching CUDA subfolders:

| Source Folder | Destination Folder |
| ------------- | ------------------ |
| bin           | bin                |
| include       | include            |
| lib           | lib                |

> \[!NOTE]
> You must log in with an NVIDIA Developer account to download cuDNN (registration is free).

---

## Install PyTorch with CUDA Support

Visit the official page for installation commands:

**[PyTorch Get Started](https://pytorch.org/get-started/locally/)**

For CUDA 11.8, run:

```bash
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
```

> \[!TIP]
> Match `pytorch-cuda=XX.X` with your installed **CUDA version**.

## Test GPU Setup

Create a Python file named `test_gpu.py` with the following code:

```python
import torch

print("Total GPUs:", torch.cuda.device_count())
print("GPU Name:", torch.cuda.get_device_name(0) if torch.cuda.is_available() else "No GPU detected")

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("Currently using device:", device)
```

Run it from your environment:

```bash
python test_gpu.py
```

If successful, your GPU name and CUDA usage will be confirmed.

## Optional Tools for Advanced Users

* [ ] **nvidia-smi**: Monitor GPU usage in real time
* [ ] **TensorBoard**: Visualize training metrics
* [ ] **JupyterLab**: Run interactive Python notebooks

## Troubleshooting Tips

> \[!WARNING]
> Getting errors like "CUDA not found" or "cuDNN missing"?

Check the following:

* CUDA version and cuDNN version **must match**
* Ensure CUDA and cuDNN **paths are correctly added** to environment variables
* Confirm PyTorch is installed **with CUDA support**

## You're Ready to Build

Congratulations! Your system is now fully configured for GPU-accelerated deep learning on Windows.

> \[!TIP]
> Keep your CUDA, cuDNN, and drivers in sync. Version mismatches are the most common source of errors.

## License

This guide is published under the **Unlicense**. Use, copy, modify, or distribute it freely.

**Learn more:** [https://unlicense.org/](https://unlicense.org/)

## 😊 Need Help?

If you run into issues, feel free to reach out, submit a pull request, or open an issue.

Good luck on your deep learning journey!
