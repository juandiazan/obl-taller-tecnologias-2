# obl-taller-tecnologias-2

## Requerimientos

Python 3.13 y los paquetes de `requirements.txt`.

## Instalación

### 1. Ejecutar los siguientes comandos

```sh
python3.13 -m venv .venv
source .venv/bin/activate        
# Windows: .venv\Scripts\activate
pip install -r requirements.txt
jupyter lab
```

Nota: si la PC tiene GPU de Nvidia, borrar `--extra-index-url` de `requirements.txt` antes de instalar.

### 2. En VS Code, elegir `.venv` como kernel del notebook

No hace falta correr la celda `%pip install` del notebook (es para Colab).

### 3. Crear cuentas de Hugging Face y Pinecone y poner los tokens en un .env

Crear un `.env` con:

```sh
HF_TOKEN=hf_...
PINECONE_API_KEY=...
```

Al usar `jupyter lab`, correr `hf auth login` para el token de Hugging Face.
