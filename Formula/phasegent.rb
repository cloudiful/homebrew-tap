class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.0/phasegent-v2.18.0-aarch64-apple-darwin"
      sha256 "128c18c915d5e87f53af783d6496bb072f88e38dde6beac7aa76e17f742c59fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.0/phasegent-v2.18.0-aarch64-unknown-linux-gnu"
      sha256 "8d7cf2b3b84645296541c4be808a6d74094a5a79fe9cf13be9de8e45d5931edf"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.0/phasegent-v2.18.0-x86_64-unknown-linux-gnu"
      sha256 "3c93fad9907640b9b6f3f9d199fe25c4199f47c3482572687f5789575f272163"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["phasegent-*"].first => "phasegent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phasegent --version")
  end
end
