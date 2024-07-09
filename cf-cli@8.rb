class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.7.11"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.7.11"
      sha256 "29a55e6cc10b7a1ee884553d086fd48e2c34fcdc580dccc0a2ba6436cc6b644e"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.7.11"
      sha256 "25501b55885f4e73943e0f29e853d21c3229a443c200b45197467f58af026cd2"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.7.11&source=homebrew"
    sha256 "a9f32cb0a9f55ee729738bb7f01637ce57bdf30aaf17bfe2250d2e6b93ab5937"
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
