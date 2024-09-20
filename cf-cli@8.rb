class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.8.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.8.2"
      sha256 "e58749de3a1e2e8d9df7115821b091b2427979b52dcb7894bcaef44bc18d9055"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.8.2"
      sha256 "99dd8d4b9f8ac03393d764fdedd35752f3cc5b77c2c1e3da92ffd0122143775e"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.8.2&source=homebrew"
    sha256 "5f8a0c12a257b0eaf90f0d98cfcb617d1c0e2360e43cda4e64045c0f5a50248d"
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
