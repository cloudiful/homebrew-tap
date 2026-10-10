class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.23.0/phasegent-v2.23.0-aarch64-apple-darwin"
      sha256 "f029c6a5396126be9dfe39c0bfb230e10b068edf97e197e685df3236130692cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.23.0/phasegent-v2.23.0-aarch64-unknown-linux-gnu"
      sha256 "49171383b362ff7790ce1c6c76fc545082acad4006c1b146f9ad2ea3da076e77"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.23.0/phasegent-v2.23.0-x86_64-unknown-linux-gnu"
      sha256 "f642d0ee36007cae5295c179c0d0fbbeb757f5cc0d8bc05b060c48e2fbf2cd71"
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
