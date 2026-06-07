class CostoraAgent < Formula
  desc "Metadata-only Costora local agent for PR cost receipts"
  homepage "https://github.com/costora"
  url "https://github.com/0dust/homebrew-costora/releases/download/v0.1.4-dev.20260607/costora-agent-release.tar.gz"
  sha256 "bc36c2c6387bdecb7f84377b1e4865ab2ef98326f00aee449bca0ad28a1388fe"
  version "0.1.4-dev.20260607"

  depends_on :macos

  def install
    apple_silicon_hardware = Utils.safe_popen_read("/usr/sbin/sysctl", "-n", "hw.optional.arm64").strip == "1"
    artifact = apple_silicon_hardware ? "costora-agent_darwin_arm64" : "costora-agent_darwin_amd64"
    bin.install artifact => "costora-agent"
  end

  test do
    output = shell_output("#{bin}/costora-agent version")
    assert_match "costora-agent", output
    refute_match(/token|secret|api_key|prompt|completion|transcript|raw_jsonl|raw_otel|diff|patch/i, output)
  end
end
