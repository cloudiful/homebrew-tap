class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  version "2.12.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.12.16/phasegent-v2.12.16-aarch64-apple-darwin"
      sha256 "84eefdccf9c7902064e5dad104336bcab96dc1122410089937891957ac46a207"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.12.16/phasegent-v2.12.16-aarch64-unknown-linux-gnu"
      sha256 "0446c1f2d04f3bc095bfd7620d8d149d4e2d3b243bc0a8f4cf702fc1fac8f44f"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.12.16/phasegent-v2.12.16-x86_64-unknown-linux-gnu"
      sha256 "5b84700a23a37c7fd00180f314bc56b065bdfd6c371fb2db8d5befcb8f9315f2"
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
