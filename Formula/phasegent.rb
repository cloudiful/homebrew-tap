class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.1/phasegent-v2.20.1-aarch64-apple-darwin"
      sha256 "3dc0ebb3d3eabcd18501f6390f1faa8f27bbcfbc36368272d76460e27071538f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.1/phasegent-v2.20.1-aarch64-unknown-linux-gnu"
      sha256 "6fdf2cb66afcd91d50e6ece2d064d65a2cea0786ccfd2bee9b83e1a340d264dc"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.1/phasegent-v2.20.1-x86_64-unknown-linux-gnu"
      sha256 "5ef738589a51fcaa3d60249fb3e9fb64ab6e522a7e07e0e97ba055383a7aea19"
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
