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
  languages.python = {
    enable = true;
    package = pkgs.python313;
    manylinux.enable = true;
    venv.enable = true;

    # Shared with non-Nix setups (see README).
    venv.requirements = builtins.readFile ./requirements.txt;
  };

  # https://devenv.sh/tests/
  enterTest = ''
    python -c "import torch, pandas, pypdf, spacy, sentence_transformers, langchain_community, langchain_huggingface, langchain_pinecone, pinecone"
  '';

  # See full reference at https://devenv.sh/reference/options/
}
