require File.expand_path('../spec_helper', __FILE__)

module Danger
  describe Danger::DangerHlint do
    it 'should be a plugin' do
      expect(Danger::DangerHlint.new(nil)).to be_a Danger::Plugin
    end

    #
    # You should test your custom attributes and methods here
    #
    describe 'with Dangerfile' do
      before do
        @dangerfile = testing_dangerfile
        @hlint = @dangerfile.hlint
        allow(@hlint.git).to receive(:added_files).and_return([])
        allow(@hlint.git).to receive(:modified_files).and_return([])

        @hlint_response = '[{"module":"HaskellTestFile","decl":"foo","severity":"Warning","hint":"Use concatMap","file":"./HaskellTestFile.hs","startLine":6,"startColumn":10,"endLine":6,"endColumn":28,"from":"concat (map id xs)","to":"concatMap id xs","note":[],"refactorings":"[Replace {rtype = Expr, pos = SrcSpan {startLine = 6, startCol = 10, endLine = 6, endCol = 28}, subts = [(\"f\",SrcSpan {startLine = 6, startCol = 22, endLine = 6, endCol = 24}),(\"x\",SrcSpan {startLine = 6, startCol = 25, endLine = 6, endCol = 27})], orig = \"concatMap f x\"}]"}
,{"module":"HaskellTestFile","decl":"foo","severity":"Warning","hint":"Use id","file":"./HaskellTestFile.hs","startLine":6,"startColumn":18,"endLine":6,"endColumn":24,"from":"map id","to":"id","note":[],"refactorings":"[Replace {rtype = Expr, pos = SrcSpan {startLine = 6, startCol = 18, endLine = 6, endCol = 24}, subts = [], orig = \"id\"}]"}]'

      end

      # Some examples for writing tests
      # You should replace these with your own.

      it "collects Warnings" do
        expect(DangerHlint).to receive(:lint)
          .with(File.expand_path('spec/fixtures/HaskellTestFile.hs'), hash_including(:inline_mode => true))
          .and_return(@hlint_response)

      end

    end
  end
end
