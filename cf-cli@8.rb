class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.16.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.16.0"
      sha256 "2341dc356bad37fd575360ee3c0ebd87381315c8101215dfa2bef6d8343431c0"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.16.0"
      sha256 "9a02b2918c5a5b0c6035869182634514a80be4ab89736eef913b368c43fef995"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.16.0&source=homebrew"
    sha256 "9577fb1c0c6a40056f97c9df241352ae0d096d498d3f1215f2702b3745e6bf06"
  end

  def install
    bin.install "cf8"
    bin.install_symlink "cf8" => "cf"
    (bash_completion/"cf8-cli").write <<-completion
# bash completion for Cloud Foundry CLI

_cf-cli() {
    # All arguments except the first one
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    # Only split on newlines
    local IFS=$'\n'
    # Call completion (note that the first element of COMP_WORDS is
    # the executable itself)
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}
complete -F _cf-cli cf8
complete -F _cf-cli cf
    completion
    doc.install "LICENSE"
    doc.install "NOTICE"
  end

  test do
    system "#{bin}/cf8"
  end
end
