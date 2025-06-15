import torch

print("Total GPUs:", torch.cuda.device_count())
print(
    "GPU Name:",
    torch.cuda.get_device_name(0) if torch.cuda.is_available() else "No GPU detected",
)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("Currently using device:", device)
