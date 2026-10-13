{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/packages/
  packages = [pkgs.git];

  dotenv.enable = true;

  # https://devenv.sh/languages/
  # Python 3.13 matches the Colab runtime the notebook was developed on.
  languages.python = {
    enable = true;
    package = pkgs.python313;
    # pip wheels (numpy, torch, spacy...) need libz/libstdc++, which NixOS doesn't expose by default.
    manylinux.enable = true;
    venv.enable = true;
    # Same packages as the `%pip install` cell in the notebook, plus Jupyter to run it locally.
    # VSCodium's Jupyter extension needs `jupyter` + `notebook` when it can't start kernels directly.
    # torch comes from the CPU index so pip doesn't pull ~3GB of CUDA wheels (no NVIDIA GPU here).
    venv.requirements = ''
      --extra-index-url https://download.pytorch.org/whl/cpu
      torch
      sentence-transformers
      langchain
      langchain-core
      langchain-community
      langchain-huggingface
      langchain-pinecone
      pinecone
      spacy
      pypdf
      pandas
      ipykernel
      jupyter
      notebook
      jupyterlab
    '';
  };

  # https://devenv.sh/tests/
  enterTest = ''
    python -c "import torch, pandas, pypdf, spacy, sentence_transformers, langchain_community, langchain_huggingface, langchain_pinecone, pinecone"
  '';

  # See full reference at https://devenv.sh/reference/options/
}
