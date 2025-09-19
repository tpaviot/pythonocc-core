import socket

def get_available_port(port: int) -> int: ...
def get_interface_ip(family: socket.AddressFamily) -> str: ...
def start_server(
    addr: str = "127.0.0.1",
    port: int = 8080,
    x3d_path: str = ".",
    open_webbrowser: bool = False,
) -> None: ...
