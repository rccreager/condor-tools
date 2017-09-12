AAA() {
    // TFile *f = new TFile("/afs/e4.physik.uni-dortmund.de/group/atlas/data/btagging/iburmeis15_8TeV_pTrel_DC14/HSG5_Framework_Test/ntuples/JZ2W_v2.root");
    // TFile *f = new TFile("/afs/e4.physik.uni-dortmund.de/group/atlas/data/btagging/iburmeis15_13TeV_pTrel_run2/HSG5Test/mc15_13TeV.427030.Pythia8EvtGen_A14NNPDF23LO_jetjet_JZ1WA_mufilter.merge.AOD.e3968_s2608_s2183_r6630_r6264.root");
    //TFile *f = new TFile("/afs/e4.physik.uni-dortmund.de/group/atlas/data/btagging/iburmeis15_13TeV_pTrel_run2/2015-11-27-DataTuple-FTAG1/ntuple.data15_13TeV.00282631.DAOD_FTAG1.root");
    TFile *f = new TFile("NAME"); 
    f->ls();
    // FlavourTagging_Nominal->MakeClass("Looper","selector");
    FlavourTagging_Nominal->MakeSelector("Looper");
    exit(0);
}
