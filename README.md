![](https://img.shields.io/badge/Microverse-blueviolet)

# Enumerables

This project implements different custom enumerator methods:

- my_each, my_each_with_index, my_selct, my_all?, my_any?, my_none?, my_count, my_map, my_inject.
  Each method is expected to behave exactly like the equivalent built in method in Enumerables module

## Description

### my_each

- This method accepts a block and iterates through each element and do the block operation to each element

### my_each_with_index

- This method varies from the 'my_each' method in that it takes the index of the list or array elements as block argument in addition to the element value

### my_selct

- This method iterates through an array or list and selects those elements which statisfies the given block condition and outputs a new array

### my_all?

- This method iterates through all the elements of a list or an array and checks if all satisfy teh given condition. If all statisfies teh given condition it returns true else when it finds an element which doesn't satisfy, it returns false.

### my_any?

- This method iterates through all the elements of a list or an array and checks until it finds one element whcich satisfies the given condition. If it gets one element that satisfies it returns true, otherwise it returns flase.

### my_none?

- This method iterates through all the elements of a list or an array and checks until it finds one element which satisfies the given condition. If it gets one element that satisfies it returns false, otherwise it returns true.

### my_count

- This method iterates through all the elements of a list and counts when an element satisfies the given condition. If the element does not satisfy the given condition, it skips to the next element. It retuerns teh final count value.

### my_map

- This method iterates through all the elements of a list and does the block operation to every element, stores the value into new array and returns the new array.

### my_inject

- This method iterates through all the elements of a list, accepts the yield value and the element value as arguments and returns the final yield value.

## Built With

- Ruby
- VS code

## Getting Started

### Prerequisites

- Ruby

## Setup

To run this project locally, please ensure you have Ruby installed on your machine, then clone this repository by running.

```bash
git clone https://github.com/henatan99/enumerators-
```

After cloning run

```bash
cd enumerators-
```

Lastly run either of the commands listed in the getting started section above.
**Run the code demonstrations below**

```bash
ruby main.rb
```

## Authors

:bust_in_silhouette: **Iris Enaelle Kineza**

- GitHub: [@KinezaEnaelle](https://github.com/KinezaEnaelle)
- Twitter: [@IKineza](https://twitter.com/IKineza)
- LinkedIn: [Iris Enaelle Kineza](https://www.linkedin.com/in/iris-enaelle-kineza-25a676187/)
  :bust_in_silhouette: **Henok Mossissa**
- GitHub: [@henatan99](https://github.com/henatan99)
- Twitter: [@henatan99](https://twitter.com/henatan99)
- LinkedIn: [Henok Mossissa](https://www.linkedin.com/in/henok-mekonnen-2a251613/)

## :handshake: Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a :star:️ if you like this project!

## :memo: License

This project is [MIT](./LICENSE) licensed.

Message Henok Mekonnen Mossissa
