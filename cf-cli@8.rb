class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.7.9"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.7.9"
      sha256 "3b266a315528dea90221d38c4e9afc131e47d2ec39aa316b75cc4472905b31b7"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.7.9"
      sha256 "f40623c5a9df49c8a643aed2e0503be8523085c7373f91d3957175bd764aa5a8"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.7.9&source=homebrew"
    sha256 "05e074abd6ad8969c997d02d924308eabdd1ca64aaa5b75182b7e44dddf024f6"
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
