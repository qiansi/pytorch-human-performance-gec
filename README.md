# pytorch-human-performance-gec

A PyTorch implementation of "Reaching Human-level Performance in Automatic Grammatical Error Correction: An Empirical Study"

## Initialize Submodules

After checking out the repository, be sure to initialize the OpenNMT-py repository:

```sh
git submodule update --init --recursive
```

## Preparing Data

The first step is to prepare the source and target pairs of training and validation data. To split the Lang-8 learner data training set, use the following command:

```sh
python transform-lang8.py -src_dir <dataset-src> -out_dir <corpus-dir>
```

Once the data has been extracted from the dataset, use OpenNMT to prepare the training and validation data and create the vocabulary:

```sh
preprocess-lang8.bat
```

## Train the Model

To train the error-correcting model, run the following command:

```sh
train.bat
```

Note that this script may need to be adjusted based on the GPU and memory resources available for training.

## Testing the Model

To test the model, run the following command to try to correct a test list of sentences:

```sh
translate.bat
```

After the sentences have been translated, the source and target sentence may be compared side to side using the following command:

```sh
python compare.py
```

## Patching OpenNMT-py

If `preprocess.py` fails with a TypeError, then you may need to patch OpenNMT-py.

Update `OpenNMT-py\onmt\inputters\dataset_base.py` with the following code:

```python
def __reduce_ex__(self, proto):
    "This is a hack. Something is broken with torch pickle."
    return super(DatasetBase, self).__reduce_ex__(proto)
```