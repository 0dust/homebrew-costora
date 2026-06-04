class CostoraAgent < Formula
  desc "Metadata-only Costora local agent for PR cost receipts"
  homepage "https://github.com/costora"
  url "https://github.com/0dust/homebrew-costora/releases/download/v0.1.1/costora-agent-release.tar.gz"
  sha256 "eb0c7e2005dfb18fb5b2daeba6ba381f6770749d24c5a4eb2a6110baeb601072"
  version "0.1.1"

  depends_on :macos

  def install
    artifact = Hardware::CPU.intel? ? "pr-cost-agent_darwin_amd64" : "pr-cost-agent_darwin_arm64"
    bin.install artifact => "costora-agent"
  end

  test do
    output = shell_output("#{bin}/costora-agent version")
    assert_match "costora-agent", output
    refute_match(/token|secret|api_key|prompt|completion|transcript|raw_jsonl|raw_otel|diff|patch/i, output)
  end
end
