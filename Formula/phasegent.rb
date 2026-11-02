class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.3/phasegent-v2.32.3-aarch64-apple-darwin"
      sha256 "bfe77fefdde5601928e430568f41110e92a3a3c60614fbd4dc9eac9eb0b57bad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.3/phasegent-v2.32.3-aarch64-unknown-linux-gnu"
      sha256 "56590e7062fc61de2db3376656f651a0aa67c4395871d6a7c0b8e56f6ea7f04c"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.3/phasegent-v2.32.3-x86_64-unknown-linux-gnu"
      sha256 "dd071821a35a0ed16998ac83bf133c253a397f901075a553772089d341a0b4fe"
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
