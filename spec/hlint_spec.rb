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
      end

      # Some examples for writing tests
      # You should replace these with your own.

      it 'collects Warnings' do
        @hlint.lint([File.expand_path('spec/fixtures/HaskellTestFile.hs')], inline_mode: true)
        expect(@hlint.warnings).to all(include('severity' => 'Warning'))
      end
    end
  end
end
