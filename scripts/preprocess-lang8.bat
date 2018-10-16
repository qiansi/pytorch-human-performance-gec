python ..\OpenNMT-py\preprocess.py^
    -train_src ..\corpus\lang8-train-src.txt^
    -train_tgt ..\corpus\lang8-train-tgt.txt^
    -valid_src ..\corpus\lang8-test-src.txt^
    -valid_tgt ..\corpus\lang8-test-tgt.txt^
    -shuffle 1^
    -lower^
    -dynamic_dict^
    -share_vocab^
    -src_vocab_size 30000^
    -tgt_vocab_size 30000^
    -save_data ..\models\lang8
