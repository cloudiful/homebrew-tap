class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.19.0/phasegent-v2.19.0-aarch64-apple-darwin"
      sha256 "cbffe5aed5d81cda239afd042eb2fc1196ff9b518637dd3f368d03ad0071272c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.19.0/phasegent-v2.19.0-aarch64-unknown-linux-gnu"
      sha256 "0a870ae2cc6beaa1cdf184f5008b44081d8984b8fa3c3611669f0fcec802545a"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.19.0/phasegent-v2.19.0-x86_64-unknown-linux-gnu"
      sha256 "609d57256093d6fed7b1be0fdff2a95755f461c7033cee724208faf7cf82645f"
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
