class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.1/phasegent-v2.18.1-aarch64-apple-darwin"
      sha256 "88432efe26ec5c2746810cd51da05caff73350fdbd2b14e045e195d9e4a2b4e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.1/phasegent-v2.18.1-aarch64-unknown-linux-gnu"
      sha256 "f26f74062cf2393e55efac2b8ffb774e8012b32c9d0b67a0112ca106d2f530e1"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.1/phasegent-v2.18.1-x86_64-unknown-linux-gnu"
      sha256 "ce633195591fd934ccc1b6267075e25296387e8f3b67bb6f4498ffee91da4bd0"
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
