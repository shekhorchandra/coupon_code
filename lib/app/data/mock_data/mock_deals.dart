const String mockDeals = r'''
[{
  "id": 1,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/107x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/109x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/149x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Sriracha Sauce",
  "category": [
    {
      "id": 1,
      "name": "Garden"
    },
    {
      "id": 2,
      "name": "Food - Beverages"
    },
    {
      "id": 3,
      "name": "Clothing"
    },
    {
      "id": 4,
      "name": "Food - Prepared Foods"
    },
    {
      "id": 5,
      "name": "Fitness"
    }
  ],
  "highlights": "Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.",
  "description": "Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.",
  "couponCode": "AA6888",
  "regularPrice": 233.55,
  "discountPercentage": 78,
  "afterDiscountPrice": 51.381,
  "dealPlan": [

  ],
  "expireDate": "12-Feb-2026",
  "views": 359834,
  "isActive": false
}, {
  "id": 2,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/150x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/176x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/142x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/209x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Sweet Chili Sauce",
  "category": [
    {
      "id": 1,
      "name": "Automotive"
    }
  ],
  "highlights": "Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.",
  "description": "Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.",
  "couponCode": "AC7951",
  "regularPrice": 115.92,
  "discountPercentage": 21,
  "afterDiscountPrice": 91.5768,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.",
      "price": 59.55
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      "price": 65.21
    }
  ],
  "expireDate": "16-Feb-2027",
  "views": 268168,
  "isActive": false
}, {
  "id": 3,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/166x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/161x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/186x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/244x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/189x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Portable Air Conditioner",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Health"
    },
    {
      "id": 3,
      "name": "Food - Produce"
    },
    {
      "id": 4,
      "name": "Food - Baking"
    }
  ],
  "highlights": "Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
  "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "couponCode": "DL4436",
  "regularPrice": 789.09,
  "discountPercentage": 26,
  "afterDiscountPrice": 583.9266,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.",
      "price": 93.16
    }
  ],
  "expireDate": "22-Oct-2026",
  "views": 706304,
  "isActive": false
}, {
  "id": 4,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/187x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Hummus Variety Pack",
  "category": [
    {
      "id": 1,
      "name": "Fitness"
    },
    {
      "id": 2,
      "name": "Home"
    }
  ],
  "highlights": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.",
  "description": "Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
  "couponCode": "KL3414",
  "regularPrice": 149.61,
  "discountPercentage": 72,
  "afterDiscountPrice": 41.8908,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.",
      "price": 20.68
    }
  ],
  "expireDate": "03-May-2027",
  "views": 532281,
  "isActive": false
}, {
  "id": 5,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/100x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/156x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/217x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Frozen Edamame",
  "category": [
    {
      "id": 1,
      "name": "Food - Meat"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Home"
    },
    {
      "id": 4,
      "name": "Crafts"
    }
  ],
  "highlights": "Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.",
  "description": "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.",
  "couponCode": "AF9171",
  "regularPrice": 461.39,
  "discountPercentage": 77,
  "afterDiscountPrice": 106.1197,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
      "price": 10.97
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
      "price": 56.44
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Nulla tellus. In sagittis dui vel nisl.",
      "price": 4.6
    }
  ],
  "expireDate": "04-Jan-2027",
  "views": 949070,
  "isActive": false
}, {
  "id": 6,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/222x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/159x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/168x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/242x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/180x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Beef Enchilada Casserole",
  "category": [
    {
      "id": 1,
      "name": "Home"
    },
    {
      "id": 2,
      "name": "Automotive"
    },
    {
      "id": 3,
      "name": "Food - Beverages"
    },
    {
      "id": 4,
      "name": "Food - Seafood"
    },
    {
      "id": 5,
      "name": "Food - Frozen Foods"
    }
  ],
  "highlights": "Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
  "description": "Sed ante. Vivamus tortor. Duis mattis egestas metus.",
  "couponCode": "UA5817",
  "regularPrice": 479.12,
  "discountPercentage": 14,
  "afterDiscountPrice": 412.0432,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.",
      "price": 44.65
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
      "price": 8.9
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Vivamus in felis eu sapien cursus vestibulum.",
      "price": 76.33
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.",
      "price": 27.83
    }
  ],
  "expireDate": "15-Jul-2027",
  "views": 925158,
  "isActive": false
}, {
  "id": 7,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/120x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/221x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/145x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/235x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/112x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Greek Yogurt",
  "category": [
    {
      "id": 1,
      "name": "Electronics"
    },
    {
      "id": 2,
      "name": "Food - Dips"
    }
  ],
  "highlights": "Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.",
  "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
  "couponCode": "AI5363",
  "regularPrice": 785.47,
  "discountPercentage": 69,
  "afterDiscountPrice": 243.4957,
  "dealPlan": [

  ],
  "expireDate": "26-May-2026",
  "views": 797479,
  "isActive": true
}, {
  "id": 8,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/183x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/197x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/200x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/183x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/240x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Fitness Jump Rope with LCD Counter",
  "category": [
    {
      "id": 1,
      "name": "Food - Beverages"
    }
  ],
  "highlights": "In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.",
  "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
  "couponCode": "EK8648",
  "regularPrice": 381.31,
  "discountPercentage": 17,
  "afterDiscountPrice": 316.4873,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
      "price": 6.35
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Quisque ut erat.",
      "price": 28.7
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
      "price": 23.08
    }
  ],
  "expireDate": "07-Mar-2027",
  "views": 693475,
  "isActive": false
}, {
  "id": 9,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/138x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Classic Beef Chili",
  "category": [
    {
      "id": 1,
      "name": "Clothing - Activewear"
    }
  ],
  "highlights": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.",
  "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "couponCode": "AC1314",
  "regularPrice": 388.5,
  "discountPercentage": 59,
  "afterDiscountPrice": 159.285,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.",
      "price": 80.95
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.",
      "price": 48.98
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
      "price": 12.08
    }
  ],
  "expireDate": "10-Jun-2027",
  "views": 763903,
  "isActive": false
}, {
  "id": 10,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/109x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/233x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Toilet Paper (12 rolls)",
  "category": [
    {
      "id": 1,
      "name": "Accessories"
    }
  ],
  "highlights": "Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.",
  "description": "Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
  "couponCode": "AC3744",
  "regularPrice": 672.5,
  "discountPercentage": 33,
  "afterDiscountPrice": 450.575,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.",
      "price": 84.8
    }
  ],
  "expireDate": "30-Mar-2025",
  "views": 938395,
  "isActive": true
}, {
  "id": 11,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/179x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/197x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/118x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/148x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/102x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Cauliflower Rice Stir-Fry",
  "category": [
    {
      "id": 1,
      "name": "Smart Home"
    },
    {
      "id": 2,
      "name": "Food - Beverages"
    }
  ],
  "highlights": "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.",
  "description": "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "couponCode": "CX4520",
  "regularPrice": 232.23,
  "discountPercentage": 67,
  "afterDiscountPrice": 76.6359,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.",
      "price": 8.56
    }
  ],
  "expireDate": "28-Jun-2027",
  "views": 994169,
  "isActive": false
}, {
  "id": 12,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/183x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/213x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/238x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/243x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Sweet Potatoes (organic)",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Food - Baking"
    },
    {
      "id": 3,
      "name": "Food - Condiments"
    }
  ],
  "highlights": "Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.",
  "description": "Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.",
  "couponCode": "SK4212",
  "regularPrice": 59.57,
  "discountPercentage": 23,
  "afterDiscountPrice": 45.8689,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.",
      "price": 78.77
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.",
      "price": 45.09
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.",
      "price": 87.32
    }
  ],
  "expireDate": "19-Mar-2025",
  "views": 855004,
  "isActive": false
}, {
  "id": 13,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/160x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Electric Heat Press Machine",
  "category": [

  ],
  "highlights": "Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
  "description": "In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.",
  "couponCode": "DL4723",
  "regularPrice": 92.08,
  "discountPercentage": 33,
  "afterDiscountPrice": 61.6936,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
      "price": 58.03
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
      "price": 98.41
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Duis mattis egestas metus. Aenean fermentum.",
      "price": 15.48
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.",
      "price": 92.03
    }
  ],
  "expireDate": "19-Oct-2025",
  "views": 587646,
  "isActive": true
}, {
  "id": 14,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/206x100.png/cc0000/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Ethical Wool Scarf",
  "category": [
    {
      "id": 1,
      "name": "Bicycles"
    },
    {
      "id": 2,
      "name": "Office"
    },
    {
      "id": 3,
      "name": "Home"
    },
    {
      "id": 4,
      "name": "Food - Vegetables"
    }
  ],
  "highlights": "Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.",
  "description": "Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
  "couponCode": "BA7967",
  "regularPrice": 37.95,
  "discountPercentage": 66,
  "afterDiscountPrice": 12.903,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.",
      "price": 96.21
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.",
      "price": 91.24
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Cras in purus eu magna vulputate luctus.",
      "price": 30.57
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Etiam justo.",
      "price": 40.44
    }
  ],
  "expireDate": "17-Jul-2025",
  "views": 965965,
  "isActive": true
}, {
  "id": 15,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/169x100.png/cc0000/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Chocolate Mint Protein Shake",
  "category": [
    {
      "id": 1,
      "name": "Food - Pasta"
    }
  ],
  "highlights": "Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.",
  "description": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.",
  "couponCode": "KL7828",
  "regularPrice": 704.1,
  "discountPercentage": 69,
  "afterDiscountPrice": 218.271,
  "dealPlan": [

  ],
  "expireDate": "23-Aug-2027",
  "views": 963254,
  "isActive": false
}, {
  "id": 16,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/162x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/226x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/209x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/127x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Chocolate Chip Pancake Mix",
  "category": [
    {
      "id": 1,
      "name": "Toys"
    },
    {
      "id": 2,
      "name": "Food - Snacks"
    },
    {
      "id": 3,
      "name": "Beauty"
    },
    {
      "id": 4,
      "name": "Smart Home"
    }
  ],
  "highlights": "Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
  "description": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
  "couponCode": "SQ3948",
  "regularPrice": 695.84,
  "discountPercentage": 63,
  "afterDiscountPrice": 257.4608,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.",
      "price": 78.5
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Aenean sit amet justo.",
      "price": 49.79
    }
  ],
  "expireDate": "12-Jun-2026",
  "views": 883232,
  "isActive": false
}, {
  "id": 17,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/123x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/191x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/242x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Inflatable Party Cooler",
  "category": [
    {
      "id": 1,
      "name": "Food - Spices"
    },
    {
      "id": 2,
      "name": "Food - Sides"
    },
    {
      "id": 3,
      "name": "Home"
    }
  ],
  "highlights": "Fusce consequat.",
  "description": "Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
  "couponCode": "SA8119",
  "regularPrice": 806.81,
  "discountPercentage": 73,
  "afterDiscountPrice": 217.8387,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.",
      "price": 43.33
    }
  ],
  "expireDate": "14-Feb-2026",
  "views": 955122,
  "isActive": false
}, {
  "id": 18,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/107x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Coconut Milk Ice Cream",
  "category": [
    {
      "id": 1,
      "name": "Health"
    },
    {
      "id": 2,
      "name": "Outdoor"
    },
    {
      "id": 3,
      "name": "Food - Prepared Meals"
    }
  ],
  "highlights": "Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.",
  "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.",
  "couponCode": "LH5409",
  "regularPrice": 813.98,
  "discountPercentage": 76,
  "afterDiscountPrice": 195.3552,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Nunc rhoncus dui vel sem.",
      "price": 76.45
    }
  ],
  "expireDate": "02-Jul-2026",
  "views": 660424,
  "isActive": true
}, {
  "id": 19,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/138x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/195x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/246x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/110x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/175x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Colorful Post-It Notes Set",
  "category": [
    {
      "id": 1,
      "name": "Footwear"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Food - Dairy Alternatives"
    },
    {
      "id": 4,
      "name": "Outdoor"
    }
  ],
  "highlights": "Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.",
  "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.",
  "couponCode": "AC5741",
  "regularPrice": 840.04,
  "discountPercentage": 37,
  "afterDiscountPrice": 529.2252,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.",
      "price": 28.16
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.",
      "price": 29.51
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.",
      "price": 90.99
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.",
      "price": 70.08
    },
    {
      "id": 5,
      "name": "Premium",
      "description": "Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.",
      "price": 64.85
    }
  ],
  "expireDate": "03-Jan-2026",
  "views": 223755,
  "isActive": true
}, {
  "id": 20,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/127x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/237x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/181x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/187x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/143x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Portable Camping Shower",
  "category": [
    {
      "id": 1,
      "name": "Food - Sauces"
    },
    {
      "id": 2,
      "name": "Food - Frozen Desserts"
    },
    {
      "id": 3,
      "name": "Food - Breakfast"
    },
    {
      "id": 4,
      "name": "Home Appliances"
    }
  ],
  "highlights": "Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
  "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.",
  "couponCode": "LA3215",
  "regularPrice": 727.15,
  "discountPercentage": 74,
  "afterDiscountPrice": 189.059,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.",
      "price": 49.41
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
      "price": 70.37
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.",
      "price": 33.83
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "In hac habitasse platea dictumst.",
      "price": 1.75
    },
    {
      "id": 5,
      "name": "Premium",
      "description": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.",
      "price": 88.6
    }
  ],
  "expireDate": "19-Dec-2025",
  "views": 141083,
  "isActive": false
}, {
  "id": 21,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/157x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/109x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/112x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Handheld Vacuum",
  "category": [

  ],
  "highlights": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
  "description": "Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
  "couponCode": "KL3781",
  "regularPrice": 998.23,
  "discountPercentage": 30,
  "afterDiscountPrice": 698.761,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.",
      "price": 23.96
    }
  ],
  "expireDate": "01-Jul-2026",
  "views": 766563,
  "isActive": false
}, {
  "id": 22,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/169x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/112x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/170x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/127x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/247x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Memory Foam Pillow",
  "category": [
    {
      "id": 1,
      "name": "Food - Pasta"
    }
  ],
  "highlights": "Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.",
  "description": "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "couponCode": "SQ4113",
  "regularPrice": 439.21,
  "discountPercentage": 43,
  "afterDiscountPrice": 250.3497,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.",
      "price": 53.81
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
      "price": 98.64
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
      "price": 71.9
    }
  ],
  "expireDate": "07-Nov-2026",
  "views": 687277,
  "isActive": false
}, {
  "id": 23,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/165x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/147x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/116x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/227x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/205x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Organic Tomato Ketchup",
  "category": [
    {
      "id": 1,
      "name": "Accessories"
    },
    {
      "id": 2,
      "name": "Accessories"
    },
    {
      "id": 3,
      "name": "Food - Gourmet Rice"
    }
  ],
  "highlights": "Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.",
  "description": "Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
  "couponCode": "QF9447",
  "regularPrice": 640.18,
  "discountPercentage": 14,
  "afterDiscountPrice": 550.5548,
  "dealPlan": [

  ],
  "expireDate": "28-Mar-2027",
  "views": 5933,
  "isActive": false
}, {
  "id": 24,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/204x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/220x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/222x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/155x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/210x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Sliced Turkey Breast",
  "category": [
    {
      "id": 1,
      "name": "Food - Frozen Meals"
    },
    {
      "id": 2,
      "name": "Food - Frozen Food"
    },
    {
      "id": 3,
      "name": "Food - Vegetarian"
    },
    {
      "id": 4,
      "name": "Kitchen"
    },
    {
      "id": 5,
      "name": "Food - Meat"
    }
  ],
  "highlights": "Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.",
  "description": "Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.",
  "couponCode": "AZ4289",
  "regularPrice": 975.37,
  "discountPercentage": 27,
  "afterDiscountPrice": 712.0201,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.",
      "price": 75.62
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.",
      "price": 69.71
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
      "price": 64.7
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.",
      "price": 16.5
    },
    {
      "id": 5,
      "name": "Standard",
      "description": "Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.",
      "price": 26.25
    }
  ],
  "expireDate": "11-Mar-2026",
  "views": 138357,
  "isActive": true
}, {
  "id": 25,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/133x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/198x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/170x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/230x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/190x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Skincare Fridge",
  "category": [
    {
      "id": 1,
      "name": "Clothing - Activewear"
    }
  ],
  "highlights": "Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.",
  "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.",
  "couponCode": "AF3760",
  "regularPrice": 299.71,
  "discountPercentage": 21,
  "afterDiscountPrice": 236.7709,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.",
      "price": 95.07
    }
  ],
  "expireDate": "08-Sep-2026",
  "views": 865350,
  "isActive": false
}, {
  "id": 26,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/193x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Andouille Sausage",
  "category": [
    {
      "id": 1,
      "name": "Food - Salads"
    },
    {
      "id": 2,
      "name": "Food - Frozen Foods"
    },
    {
      "id": 3,
      "name": "Food - Dairy"
    },
    {
      "id": 4,
      "name": "Food - Baking"
    }
  ],
  "highlights": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.",
  "description": "Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
  "couponCode": "AM4031",
  "regularPrice": 654.07,
  "discountPercentage": 59,
  "afterDiscountPrice": 268.1687,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      "price": 63.97
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      "price": 44.72
    }
  ],
  "expireDate": "20-May-2025",
  "views": 353716,
  "isActive": false
}, {
  "id": 27,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/238x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/185x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Gluten-Free Bread",
  "category": [

  ],
  "highlights": "Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.",
  "description": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.",
  "couponCode": "SK9544",
  "regularPrice": 481.17,
  "discountPercentage": 29,
  "afterDiscountPrice": 341.6307,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.",
      "price": 30.53
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      "price": 78.78
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.",
      "price": 31.17
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.",
      "price": 91.59
    }
  ],
  "expireDate": "27-Aug-2025",
  "views": 77942,
  "isActive": false
}, {
  "id": 28,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/118x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/131x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/155x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/149x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/197x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Kids Tablet",
  "category": [
    {
      "id": 1,
      "name": "Health"
    },
    {
      "id": 2,
      "name": "Food - Bakery"
    }
  ],
  "highlights": "Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.",
  "description": "Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
  "couponCode": "NH1887",
  "regularPrice": 529.53,
  "discountPercentage": 75,
  "afterDiscountPrice": 132.3825,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.",
      "price": 42.43
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "In congue. Etiam justo. Etiam pretium iaculis justo.",
      "price": 90.36
    }
  ],
  "expireDate": "21-Mar-2026",
  "views": 983343,
  "isActive": false
}, {
  "id": 29,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/119x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/149x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/141x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/102x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Pet Training Pads",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Fitness"
    },
    {
      "id": 4,
      "name": "Office"
    }
  ],
  "highlights": "In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.",
  "description": "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.",
  "couponCode": "AV2744",
  "regularPrice": 252.77,
  "discountPercentage": 61,
  "afterDiscountPrice": 98.5803,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.",
      "price": 46.11
    }
  ],
  "expireDate": "09-Feb-2027",
  "views": 465526,
  "isActive": false
}, {
  "id": 30,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/141x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/234x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/210x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "LED Strip Lights with Remote Control",
  "category": [
    {
      "id": 1,
      "name": "Pets"
    }
  ],
  "highlights": "Etiam faucibus cursus urna.",
  "description": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
  "couponCode": "UA3257",
  "regularPrice": 707.53,
  "discountPercentage": 75,
  "afterDiscountPrice": 176.8825,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.",
      "price": 71.77
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.",
      "price": 62.18
    }
  ],
  "expireDate": "13-Oct-2026",
  "views": 609617,
  "isActive": false
}, {
  "id": 31,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/111x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/118x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/165x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Dark Chocolate Covered Pretzels",
  "category": [
    {
      "id": 1,
      "name": "Sports"
    },
    {
      "id": 2,
      "name": "Clothing - Shirts"
    },
    {
      "id": 3,
      "name": "Fitness"
    }
  ],
  "highlights": "Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.",
  "description": "Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
  "couponCode": "QR8188",
  "regularPrice": 140.36,
  "discountPercentage": 20,
  "afterDiscountPrice": 112.288,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.",
      "price": 77.56
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Mauris lacinia sapien quis libero.",
      "price": 17.05
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "In sagittis dui vel nisl. Duis ac nibh.",
      "price": 37.33
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
      "price": 53.96
    },
    {
      "id": 5,
      "name": "Premium",
      "description": "Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.",
      "price": 48.71
    }
  ],
  "expireDate": "23-Oct-2027",
  "views": 213181,
  "isActive": true
}, {
  "id": 32,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/245x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/186x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/231x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/243x100.png/cc0000/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Almond Milk Yogurt",
  "category": [
    {
      "id": 1,
      "name": "Clothing - Tops"
    }
  ],
  "highlights": "Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.",
  "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
  "couponCode": "KE6939",
  "regularPrice": 563.4,
  "discountPercentage": 34,
  "afterDiscountPrice": 371.844,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Nulla nisl. Nunc nisl.",
      "price": 84.49
    }
  ],
  "expireDate": "15-Apr-2026",
  "views": 632056,
  "isActive": true
}, {
  "id": 33,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/215x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/219x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/187x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/224x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Energy Bites",
  "category": [
    {
      "id": 1,
      "name": "Bicycles"
    },
    {
      "id": 2,
      "name": "Food - Condiments"
    },
    {
      "id": 3,
      "name": "Outdoor"
    },
    {
      "id": 4,
      "name": "Food - Soups"
    }
  ],
  "highlights": "Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.",
  "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.",
  "couponCode": "AA6703",
  "regularPrice": 496.83,
  "discountPercentage": 68,
  "afterDiscountPrice": 158.9856,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.",
      "price": 80.27
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.",
      "price": 41.85
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.",
      "price": 63.78
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Integer tincidunt ante vel ipsum.",
      "price": 61.65
    },
    {
      "id": 5,
      "name": "Standard",
      "description": "Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.",
      "price": 30.9
    }
  ],
  "expireDate": "26-Jan-2027",
  "views": 672522,
  "isActive": false
}, {
  "id": 34,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/242x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/189x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/244x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/241x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/194x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Almond Flour Bread Mix",
  "category": [
    {
      "id": 1,
      "name": "Pets"
    },
    {
      "id": 2,
      "name": "Food - Frozen Foods"
    },
    {
      "id": 3,
      "name": "Office"
    }
  ],
  "highlights": "Praesent blandit lacinia erat.",
  "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
  "couponCode": "DL4369",
  "regularPrice": 161.77,
  "discountPercentage": 77,
  "afterDiscountPrice": 37.2071,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.",
      "price": 63.69
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.",
      "price": 94.18
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.",
      "price": 63.63
    }
  ],
  "expireDate": "12-Jun-2025",
  "views": 415267,
  "isActive": false
}, {
  "id": 35,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/162x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/112x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Adjustable Height Standing Desk Converter",
  "category": [
    {
      "id": 1,
      "name": "Food - Spices"
    },
    {
      "id": 2,
      "name": "Food - Meats"
    },
    {
      "id": 3,
      "name": "Food - Dressings"
    }
  ],
  "highlights": "Phasellus sit amet erat. Nulla tempus.",
  "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.",
  "couponCode": "EK9265",
  "regularPrice": 630.47,
  "discountPercentage": 71,
  "afterDiscountPrice": 182.8363,
  "dealPlan": [

  ],
  "expireDate": "08-Jul-2027",
  "views": 465179,
  "isActive": true
}, {
  "id": 36,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/224x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Portable Massage Gun",
  "category": [
    {
      "id": 1,
      "name": "Food - Snacks"
    },
    {
      "id": 2,
      "name": "Food - Canned Goods"
    },
    {
      "id": 3,
      "name": "Crafts"
    },
    {
      "id": 4,
      "name": "Food - Baking"
    }
  ],
  "highlights": "Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.",
  "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
  "couponCode": "AF2048",
  "regularPrice": 131.24,
  "discountPercentage": 60,
  "afterDiscountPrice": 52.496,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.",
      "price": 31.09
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.",
      "price": 14.67
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
      "price": 86.07
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.",
      "price": 35.58
    }
  ],
  "expireDate": "05-Jan-2025",
  "views": 239972,
  "isActive": false
}, {
  "id": 37,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/173x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Lemon Dill Salmon",
  "category": [
    {
      "id": 1,
      "name": "Gaming"
    },
    {
      "id": 2,
      "name": "Electronics"
    },
    {
      "id": 3,
      "name": "Clothing - Shirts"
    }
  ],
  "highlights": "Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.",
  "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
  "couponCode": "LH3189",
  "regularPrice": 784.78,
  "discountPercentage": 40,
  "afterDiscountPrice": 470.868,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.",
      "price": 12.2
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.",
      "price": 5.0
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "In est risus, auctor sed, tristique in, tempus sit amet, sem.",
      "price": 10.53
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.",
      "price": 29.84
    }
  ],
  "expireDate": "08-Mar-2027",
  "views": 716194,
  "isActive": false
}, {
  "id": 38,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/222x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/124x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/136x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Weighted Jump Rope with Counter",
  "category": [

  ],
  "highlights": "Curabitur in libero ut massa volutpat convallis.",
  "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
  "couponCode": "SQ1217",
  "regularPrice": 524.11,
  "discountPercentage": 81,
  "afterDiscountPrice": 99.5809,
  "dealPlan": [

  ],
  "expireDate": "31-May-2027",
  "views": 660995,
  "isActive": false
}, {
  "id": 39,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/158x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/197x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/146x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/186x100.png/cc0000/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Roasted Red Pepper Sauce",
  "category": [
    {
      "id": 1,
      "name": "Food - Frozen Foods"
    },
    {
      "id": 2,
      "name": "Food - Snacks"
    },
    {
      "id": 3,
      "name": "Kitchen"
    },
    {
      "id": 4,
      "name": "Electronics"
    }
  ],
  "highlights": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.",
  "description": "Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\n\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.",
  "couponCode": "TG3677",
  "regularPrice": 606.42,
  "discountPercentage": 50,
  "afterDiscountPrice": 303.21,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.",
      "price": 27.44
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.",
      "price": 79.54
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.",
      "price": 25.83
    }
  ],
  "expireDate": "07-Jun-2026",
  "views": 620585,
  "isActive": false
}, {
  "id": 40,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/134x100.png/cc0000/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Hiking Gaiters",
  "category": [
    {
      "id": 1,
      "name": "Food - Grains"
    },
    {
      "id": 2,
      "name": "Clothing - Activewear"
    },
    {
      "id": 3,
      "name": "Travel"
    },
    {
      "id": 4,
      "name": "Food - Baking"
    }
  ],
  "highlights": "Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.",
  "description": "Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.",
  "couponCode": "NH7554",
  "regularPrice": 763.15,
  "discountPercentage": 65,
  "afterDiscountPrice": 267.1025,
  "dealPlan": [

  ],
  "expireDate": "28-Oct-2025",
  "views": 158606,
  "isActive": true
}, {
  "id": 41,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/152x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Infrared Thermometer",
  "category": [

  ],
  "highlights": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
  "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
  "couponCode": "QF9353",
  "regularPrice": 560.03,
  "discountPercentage": 67,
  "afterDiscountPrice": 184.8099,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.",
      "price": 76.82
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.",
      "price": 38.51
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
      "price": 14.01
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.",
      "price": 30.2
    },
    {
      "id": 5,
      "name": "Standard",
      "description": "In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.",
      "price": 35.69
    }
  ],
  "expireDate": "31-Aug-2027",
  "views": 218307,
  "isActive": true
}, {
  "id": 42,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/203x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/140x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/155x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/189x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/238x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Adjustable Stand for Tablets and Smartphones",
  "category": [
    {
      "id": 1,
      "name": "Food - Condiments"
    }
  ],
  "highlights": "Donec vitae nisi.",
  "description": "In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
  "couponCode": "LA9586",
  "regularPrice": 829.53,
  "discountPercentage": 87,
  "afterDiscountPrice": 107.8389,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.",
      "price": 80.33
    }
  ],
  "expireDate": "19-Feb-2027",
  "views": 963585,
  "isActive": true
}, {
  "id": 43,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/142x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/187x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/230x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/144x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/159x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Dill Pickle Chips",
  "category": [
    {
      "id": 1,
      "name": "Automotive"
    },
    {
      "id": 2,
      "name": "Toys"
    },
    {
      "id": 3,
      "name": "Automotive"
    },
    {
      "id": 4,
      "name": "Kitchen"
    },
    {
      "id": 5,
      "name": "Kitchen"
    }
  ],
  "highlights": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.",
  "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.",
  "couponCode": "WN5405",
  "regularPrice": 729.85,
  "discountPercentage": 56,
  "afterDiscountPrice": 321.134,
  "dealPlan": [

  ],
  "expireDate": "04-Jun-2025",
  "views": 589135,
  "isActive": false
}, {
  "id": 44,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/116x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/233x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/182x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Biodegradable Trash Bags",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Garden"
    },
    {
      "id": 4,
      "name": "Garden"
    },
    {
      "id": 5,
      "name": "Fitness"
    }
  ],
  "highlights": "Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.",
  "description": "Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.",
  "couponCode": "KE9732",
  "regularPrice": 895.74,
  "discountPercentage": 77,
  "afterDiscountPrice": 206.0202,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
      "price": 79.38
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.",
      "price": 75.06
    }
  ],
  "expireDate": "28-Aug-2026",
  "views": 920806,
  "isActive": true
}, {
  "id": 45,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/128x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/152x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/227x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Cheddar & Bacon Potato Skins",
  "category": [
    {
      "id": 1,
      "name": "Accessories"
    }
  ],
  "highlights": "Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.",
  "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.",
  "couponCode": "DL1182",
  "regularPrice": 581.8,
  "discountPercentage": 8,
  "afterDiscountPrice": 535.256,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.",
      "price": 68.36
    }
  ],
  "expireDate": "16-Jul-2027",
  "views": 897453,
  "isActive": false
}, {
  "id": 46,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/197x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/157x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/163x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Kids' Educational Tablet",
  "category": [
    {
      "id": 1,
      "name": "Bicycles"
    }
  ],
  "highlights": "Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.",
  "description": "Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
  "couponCode": "ET5654",
  "regularPrice": 374.74,
  "discountPercentage": 53,
  "afterDiscountPrice": 176.1278,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.",
      "price": 74.4
    }
  ],
  "expireDate": "06-Sep-2026",
  "views": 366956,
  "isActive": true
}, {
  "id": 47,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/239x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/171x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/193x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/245x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/213x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Workstation Laptop Stand",
  "category": [
    {
      "id": 1,
      "name": "Food - Snacks"
    },
    {
      "id": 2,
      "name": "Accessories"
    },
    {
      "id": 3,
      "name": "Food - Condiments"
    }
  ],
  "highlights": "Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.",
  "description": "Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
  "couponCode": "NZ8951",
  "regularPrice": 972.54,
  "discountPercentage": 35,
  "afterDiscountPrice": 632.151,
  "dealPlan": [

  ],
  "expireDate": "30-Jan-2026",
  "views": 113966,
  "isActive": true
}, {
  "id": 48,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/183x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Rice Pudding",
  "category": [
    {
      "id": 1,
      "name": "Food - Dairy"
    },
    {
      "id": 2,
      "name": "Health"
    },
    {
      "id": 3,
      "name": "Food - Snacks"
    },
    {
      "id": 4,
      "name": "Beauty"
    },
    {
      "id": 5,
      "name": "Music"
    }
  ],
  "highlights": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.",
  "description": "In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
  "couponCode": "ET8525",
  "regularPrice": 843.77,
  "discountPercentage": 55,
  "afterDiscountPrice": 379.6965,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.",
      "price": 21.02
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.",
      "price": 60.24
    }
  ],
  "expireDate": "23-Jul-2027",
  "views": 359777,
  "isActive": false
}, {
  "id": 49,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/165x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/183x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/172x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/143x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/247x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Puffer Winter Coat",
  "category": [
    {
      "id": 1,
      "name": "Electronics"
    }
  ],
  "highlights": "Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
  "description": "In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.",
  "couponCode": "TG7965",
  "regularPrice": 568.98,
  "discountPercentage": 44,
  "afterDiscountPrice": 318.6288,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Suspendisse potenti.",
      "price": 68.61
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.",
      "price": 80.23
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.",
      "price": 91.34
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.",
      "price": 93.02
    }
  ],
  "expireDate": "04-Jun-2026",
  "views": 536862,
  "isActive": false
}, {
  "id": 50,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/153x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Portable Bluetooth Headphones",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Food - Frozen Foods"
    },
    {
      "id": 3,
      "name": "Food - Prepared Meals"
    }
  ],
  "highlights": "Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.",
  "description": "Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.",
  "couponCode": "WN7987",
  "regularPrice": 227.94,
  "discountPercentage": 1,
  "afterDiscountPrice": 225.6606,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.",
      "price": 77.73
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.",
      "price": 41.47
    }
  ],
  "expireDate": "15-Jul-2027",
  "views": 154963,
  "isActive": true
}, {
  "id": 51,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/132x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Lemonade Mix",
  "category": [
    {
      "id": 1,
      "name": "Fitness"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Food - Meat"
    },
    {
      "id": 4,
      "name": "Clothing - Shoes"
    },
    {
      "id": 5,
      "name": "Food - Condiments"
    }
  ],
  "highlights": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.",
  "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.",
  "couponCode": "AV7509",
  "regularPrice": 431.64,
  "discountPercentage": 72,
  "afterDiscountPrice": 120.8592,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      "price": 14.48
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
      "price": 50.8
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
      "price": 83.49
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.",
      "price": 71.55
    }
  ],
  "expireDate": "06-May-2025",
  "views": 347755,
  "isActive": false
}, {
  "id": 52,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/112x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/104x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/248x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/193x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Teriyaki Chicken Stir-Fry",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Kitchen"
    }
  ],
  "highlights": "Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.",
  "couponCode": "EK2146",
  "regularPrice": 655.3,
  "discountPercentage": 45,
  "afterDiscountPrice": 360.415,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.",
      "price": 11.75
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.",
      "price": 68.22
    }
  ],
  "expireDate": "02-Dec-2026",
  "views": 836344,
  "isActive": false
}, {
  "id": 53,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/207x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/154x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/111x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/147x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/182x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Low-Fat Cottage Cheese",
  "category": [

  ],
  "highlights": "Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.",
  "description": "Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
  "couponCode": "CX9670",
  "regularPrice": 803.98,
  "discountPercentage": 72,
  "afterDiscountPrice": 225.1144,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.",
      "price": 44.34
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.",
      "price": 47.06
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.",
      "price": 68.08
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
      "price": 94.76
    },
    {
      "id": 5,
      "name": "Quick Start",
      "description": "Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.",
      "price": 32.05
    }
  ],
  "expireDate": "11-Jan-2027",
  "views": 416866,
  "isActive": true
}, {
  "id": 54,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/170x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/206x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/212x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/107x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Cranberry Orange Juice",
  "category": [
    {
      "id": 1,
      "name": "Pets"
    },
    {
      "id": 2,
      "name": "Food - Condiments"
    },
    {
      "id": 3,
      "name": "Food - Condiments"
    },
    {
      "id": 4,
      "name": "Beauty"
    }
  ],
  "highlights": "Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.",
  "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.",
  "couponCode": "CX9836",
  "regularPrice": 953.84,
  "discountPercentage": 82,
  "afterDiscountPrice": 171.6912,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
      "price": 88.49
    }
  ],
  "expireDate": "20-Jan-2027",
  "views": 767671,
  "isActive": true
}, {
  "id": 55,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/170x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/231x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/144x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/184x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/178x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Hand Mixer",
  "category": [
    {
      "id": 1,
      "name": "Pets"
    },
    {
      "id": 2,
      "name": "Home"
    },
    {
      "id": 3,
      "name": "Food - Breakfast"
    },
    {
      "id": 4,
      "name": "Food - Prepared Foods"
    },
    {
      "id": 5,
      "name": "Clothing - Outerwear"
    }
  ],
  "highlights": "Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.",
  "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
  "couponCode": "SK7444",
  "regularPrice": 68.07,
  "discountPercentage": 84,
  "afterDiscountPrice": 10.8912,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.",
      "price": 40.11
    }
  ],
  "expireDate": "05-Jun-2027",
  "views": 216303,
  "isActive": false
}, {
  "id": 56,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/172x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/140x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Beef Stroganoff Mix",
  "category": [
    {
      "id": 1,
      "name": "Garden"
    },
    {
      "id": 2,
      "name": "Food - Meat"
    },
    {
      "id": 3,
      "name": "Food - Frozen Meals"
    }
  ],
  "highlights": "In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.",
  "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
  "couponCode": "WN3418",
  "regularPrice": 873.84,
  "discountPercentage": 19,
  "afterDiscountPrice": 707.8104,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
      "price": 62.37
    }
  ],
  "expireDate": "21-May-2026",
  "views": 85433,
  "isActive": true
}, {
  "id": 57,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/139x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/130x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/233x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/168x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/107x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Thai Peanut Noodles",
  "category": [
    {
      "id": 1,
      "name": "Food - Produce"
    },
    {
      "id": 2,
      "name": "Food - Grains"
    },
    {
      "id": 3,
      "name": "Home"
    }
  ],
  "highlights": "Suspendisse potenti. Nullam porttitor lacus at turpis.",
  "description": "In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
  "couponCode": "SA2968",
  "regularPrice": 961.19,
  "discountPercentage": 64,
  "afterDiscountPrice": 346.0284,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
      "price": 42.23
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.",
      "price": 40.75
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
      "price": 92.08
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
      "price": 16.25
    },
    {
      "id": 5,
      "name": "Standard",
      "description": "Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.",
      "price": 35.41
    }
  ],
  "expireDate": "08-May-2027",
  "views": 650367,
  "isActive": true
}, {
  "id": 58,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/167x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/144x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Almond Flour",
  "category": [
    {
      "id": 1,
      "name": "Automotive"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Kitchen"
    }
  ],
  "highlights": "Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.",
  "description": "Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
  "couponCode": "QR8903",
  "regularPrice": 441.06,
  "discountPercentage": 36,
  "afterDiscountPrice": 282.2784,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.",
      "price": 96.68
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.",
      "price": 90.49
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.",
      "price": 3.98
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Nulla facilisi.",
      "price": 92.11
    },
    {
      "id": 5,
      "name": "Standard",
      "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.",
      "price": 21.3
    }
  ],
  "expireDate": "18-Nov-2025",
  "views": 713069,
  "isActive": false
}, {
  "id": 59,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/115x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Garden Hose Reel",
  "category": [

  ],
  "highlights": "Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.",
  "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.",
  "couponCode": "IB1555",
  "regularPrice": 157.64,
  "discountPercentage": 32,
  "afterDiscountPrice": 107.1952,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.",
      "price": 39.26
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.",
      "price": 42.9
    }
  ],
  "expireDate": "29-Jan-2026",
  "views": 795839,
  "isActive": false
}, {
  "id": 60,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/168x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/153x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/181x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/198x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/167x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "High-Quality Yoga Block",
  "category": [
    {
      "id": 1,
      "name": "Fitness"
    },
    {
      "id": 2,
      "name": "Food - Frozen Foods"
    },
    {
      "id": 3,
      "name": "Smart Home"
    }
  ],
  "highlights": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
  "description": "Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.",
  "couponCode": "AV8676",
  "regularPrice": 699.74,
  "discountPercentage": 27,
  "afterDiscountPrice": 510.8102,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.",
      "price": 2.4
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.",
      "price": 87.59
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.",
      "price": 85.69
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.",
      "price": 94.82
    },
    {
      "id": 5,
      "name": "Standard",
      "description": "Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.",
      "price": 48.93
    }
  ],
  "expireDate": "05-Dec-2027",
  "views": 203923,
  "isActive": true
}, {
  "id": 61,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/245x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/230x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/116x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/122x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/215x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Portable Air Conditioner",
  "category": [

  ],
  "highlights": "Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.",
  "description": "Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
  "couponCode": "CX1682",
  "regularPrice": 856.68,
  "discountPercentage": 49,
  "afterDiscountPrice": 436.9068,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.",
      "price": 93.63
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.",
      "price": 18.85
    }
  ],
  "expireDate": "25-Aug-2027",
  "views": 6806,
  "isActive": true
}, {
  "id": 62,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/185x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Portable Solar Camp Shower",
  "category": [
    {
      "id": 1,
      "name": "Home Improvement"
    },
    {
      "id": 2,
      "name": "Books"
    },
    {
      "id": 3,
      "name": "Health"
    }
  ],
  "highlights": "Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.",
  "description": "Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.",
  "couponCode": "AV5508",
  "regularPrice": 2.99,
  "discountPercentage": 21,
  "afterDiscountPrice": 2.3621,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.",
      "price": 8.87
    }
  ],
  "expireDate": "01-Sep-2026",
  "views": 954384,
  "isActive": true
}, {
  "id": 63,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/167x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/163x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/233x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/231x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/208x100.png/cc0000/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Wireless Game Controller",
  "category": [
    {
      "id": 1,
      "name": "Food - Meat"
    },
    {
      "id": 2,
      "name": "Outdoor"
    },
    {
      "id": 3,
      "name": "Photography"
    },
    {
      "id": 4,
      "name": "Food - Cooking Essentials"
    },
    {
      "id": 5,
      "name": "Health"
    }
  ],
  "highlights": "Aliquam non mauris.",
  "description": "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
  "couponCode": "SQ3948",
  "regularPrice": 262.84,
  "discountPercentage": 49,
  "afterDiscountPrice": 134.0484,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.",
      "price": 6.46
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.",
      "price": 60.19
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.",
      "price": 28.38
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
      "price": 54.65
    }
  ],
  "expireDate": "03-Dec-2025",
  "views": 925367,
  "isActive": true
}, {
  "id": 64,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/106x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/169x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/173x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Sporty Cap",
  "category": [
    {
      "id": 1,
      "name": "Music"
    },
    {
      "id": 2,
      "name": "Accessories"
    },
    {
      "id": 3,
      "name": "Food - Snacks"
    },
    {
      "id": 4,
      "name": "Food - Meat"
    }
  ],
  "highlights": "Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.",
  "description": "Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
  "couponCode": "WN7726",
  "regularPrice": 271.16,
  "discountPercentage": 78,
  "afterDiscountPrice": 59.6552,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.",
      "price": 17.9
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.",
      "price": 4.68
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.",
      "price": 40.56
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
      "price": 28.95
    },
    {
      "id": 5,
      "name": "Premium",
      "description": "Morbi a ipsum. Integer a nibh. In quis justo.",
      "price": 47.0
    }
  ],
  "expireDate": "20-Dec-2025",
  "views": 553291,
  "isActive": true
}, {
  "id": 65,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/109x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/120x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/163x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/145x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Classic Leather Wallet",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    }
  ],
  "highlights": "Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
  "description": "Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.",
  "couponCode": "KE5890",
  "regularPrice": 817.69,
  "discountPercentage": 37,
  "afterDiscountPrice": 515.1447,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Proin risus. Praesent lectus.",
      "price": 27.17
    }
  ],
  "expireDate": "05-Dec-2025",
  "views": 50035,
  "isActive": false
}, {
  "id": 66,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/120x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/224x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/212x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/170x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Vegan Protein Powder",
  "category": [
    {
      "id": 1,
      "name": "Food - Snacks"
    },
    {
      "id": 2,
      "name": "Photography"
    },
    {
      "id": 3,
      "name": "Food - Condiments"
    },
    {
      "id": 4,
      "name": "Home Appliances"
    },
    {
      "id": 5,
      "name": "Food - Produce"
    }
  ],
  "highlights": "Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.",
  "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.",
  "couponCode": "AC9242",
  "regularPrice": 435.84,
  "discountPercentage": 89,
  "afterDiscountPrice": 47.9424,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus.",
      "price": 17.05
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.",
      "price": 23.93
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.",
      "price": 6.94
    }
  ],
  "expireDate": "01-Nov-2027",
  "views": 183079,
  "isActive": false
}, {
  "id": 67,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/111x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Insulated Lunch Bag",
  "category": [
    {
      "id": 1,
      "name": "Food - Condiments"
    },
    {
      "id": 2,
      "name": "Art Supplies"
    },
    {
      "id": 3,
      "name": "Clothing - Skirts"
    },
    {
      "id": 4,
      "name": "Food - Meat"
    },
    {
      "id": 5,
      "name": "Food - Produce"
    }
  ],
  "highlights": "In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.",
  "description": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
  "couponCode": "KL5923",
  "regularPrice": 570.83,
  "discountPercentage": 53,
  "afterDiscountPrice": 268.2901,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
      "price": 21.93
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Pellentesque viverra pede ac diam.",
      "price": 63.84
    }
  ],
  "expireDate": "07-Jun-2026",
  "views": 739451,
  "isActive": false
}, {
  "id": 68,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/163x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/109x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/115x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/203x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Classic Black Dress",
  "category": [
    {
      "id": 1,
      "name": "Food - Frozen Foods"
    },
    {
      "id": 2,
      "name": "Office"
    },
    {
      "id": 3,
      "name": "Kitchen"
    },
    {
      "id": 4,
      "name": "Food - Snacks"
    },
    {
      "id": 5,
      "name": "Home"
    }
  ],
  "highlights": "Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.",
  "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.",
  "couponCode": "QF1757",
  "regularPrice": 506.84,
  "discountPercentage": 21,
  "afterDiscountPrice": 400.4036,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.",
      "price": 34.71
    }
  ],
  "expireDate": "31-Mar-2025",
  "views": 269853,
  "isActive": true
}, {
  "id": 69,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/130x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/188x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/225x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/132x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/250x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Chia Seed Pudding Mix",
  "category": [
    {
      "id": 1,
      "name": "Food - Grains"
    },
    {
      "id": 2,
      "name": "Food - Condiments"
    },
    {
      "id": 3,
      "name": "Food - Beverages"
    },
    {
      "id": 4,
      "name": "Food - Grains"
    },
    {
      "id": 5,
      "name": "Clothing"
    }
  ],
  "highlights": "Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.",
  "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
  "couponCode": "AV4401",
  "regularPrice": 369.44,
  "discountPercentage": 41,
  "afterDiscountPrice": 217.9696,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.",
      "price": 85.15
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.",
      "price": 94.09
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.",
      "price": 63.89
    }
  ],
  "expireDate": "13-Dec-2027",
  "views": 312827,
  "isActive": false
}, {
  "id": 70,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/222x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/218x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/189x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/130x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/149x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Pineapple Salsa",
  "category": [
    {
      "id": 1,
      "name": "Music"
    },
    {
      "id": 2,
      "name": "Art Supplies"
    },
    {
      "id": 3,
      "name": "Travel"
    },
    {
      "id": 4,
      "name": "Kitchen"
    }
  ],
  "highlights": "Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.",
  "description": "Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
  "couponCode": "LA8565",
  "regularPrice": 652.56,
  "discountPercentage": 75,
  "afterDiscountPrice": 163.14,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.",
      "price": 33.52
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.",
      "price": 58.92
    }
  ],
  "expireDate": "25-Apr-2025",
  "views": 417536,
  "isActive": true
}, {
  "id": 71,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/230x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/240x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/138x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/234x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/208x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Pineapple Rings",
  "category": [
    {
      "id": 1,
      "name": "Food - Produce"
    },
    {
      "id": 2,
      "name": "Food - Baking & Cooking"
    }
  ],
  "highlights": "Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.",
  "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
  "couponCode": "AV9155",
  "regularPrice": 949.78,
  "discountPercentage": 53,
  "afterDiscountPrice": 446.3966,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.",
      "price": 91.49
    }
  ],
  "expireDate": "18-May-2027",
  "views": 303003,
  "isActive": true
}, {
  "id": 72,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/195x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/178x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/219x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/197x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/150x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Black Bean Spaghetti",
  "category": [
    {
      "id": 1,
      "name": "Bicycles"
    },
    {
      "id": 2,
      "name": "Food - Breakfast"
    },
    {
      "id": 3,
      "name": "Food - Grains"
    },
    {
      "id": 4,
      "name": "Food - Bakery"
    },
    {
      "id": 5,
      "name": "Health"
    }
  ],
  "highlights": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.",
  "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.",
  "couponCode": "SQ2715",
  "regularPrice": 830.51,
  "discountPercentage": 26,
  "afterDiscountPrice": 614.5774,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.",
      "price": 58.1
    }
  ],
  "expireDate": "11-Jul-2025",
  "views": 14091,
  "isActive": false
}, {
  "id": 73,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/193x100.png/cc0000/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Adjustable Garden Rake",
  "category": [
    {
      "id": 1,
      "name": "Food - Snacks"
    }
  ],
  "highlights": "Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
  "description": "Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.",
  "couponCode": "EK6270",
  "regularPrice": 240.36,
  "discountPercentage": 88,
  "afterDiscountPrice": 28.8432,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.",
      "price": 60.62
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
      "price": 31.8
    }
  ],
  "expireDate": "24-Apr-2025",
  "views": 673588,
  "isActive": true
}, {
  "id": 74,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/178x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/131x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/224x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Sweet Potatoes",
  "category": [
    {
      "id": 1,
      "name": "Bicycles"
    },
    {
      "id": 2,
      "name": "Food - Frozen"
    },
    {
      "id": 3,
      "name": "Food - Produce"
    },
    {
      "id": 4,
      "name": "Food - Dairy"
    },
    {
      "id": 5,
      "name": "Food - Salads"
    }
  ],
  "highlights": "Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.",
  "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.",
  "couponCode": "TG2002",
  "regularPrice": 922.05,
  "discountPercentage": 89,
  "afterDiscountPrice": 101.4255,
  "dealPlan": [

  ],
  "expireDate": "11-Mar-2026",
  "views": 443251,
  "isActive": false
}, {
  "id": 75,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/128x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/237x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/199x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Stainless Steel Water Bottle",
  "category": [
    {
      "id": 1,
      "name": "Food - Snacks"
    },
    {
      "id": 2,
      "name": "Clothing - Dresses"
    }
  ],
  "highlights": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
  "description": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
  "couponCode": "CX7264",
  "regularPrice": 786.71,
  "discountPercentage": 45,
  "afterDiscountPrice": 432.6905,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.",
      "price": 97.54
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.",
      "price": 22.71
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.",
      "price": 58.39
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.",
      "price": 68.09
    }
  ],
  "expireDate": "21-Feb-2025",
  "views": 595834,
  "isActive": false
}, {
  "id": 76,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/212x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/230x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/196x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Chipotle Sauce",
  "category": [
    {
      "id": 1,
      "name": "Office"
    },
    {
      "id": 2,
      "name": "Food - Snacks"
    }
  ],
  "highlights": "Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.",
  "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.",
  "couponCode": "KE8210",
  "regularPrice": 558.32,
  "discountPercentage": 55,
  "afterDiscountPrice": 251.244,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.",
      "price": 98.73
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.",
      "price": 5.19
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
      "price": 19.97
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.",
      "price": 55.15
    },
    {
      "id": 5,
      "name": "Premium",
      "description": "Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
      "price": 53.94
    }
  ],
  "expireDate": "10-Nov-2025",
  "views": 385898,
  "isActive": false
}, {
  "id": 77,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/201x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/181x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Pita Bread",
  "category": [

  ],
  "highlights": "Nam dui.",
  "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.",
  "couponCode": "NZ7151",
  "regularPrice": 906.3,
  "discountPercentage": 84,
  "afterDiscountPrice": 145.008,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.",
      "price": 10.81
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.",
      "price": 88.65
    }
  ],
  "expireDate": "01-May-2025",
  "views": 433500,
  "isActive": true
}, {
  "id": 78,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/197x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/109x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/156x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/124x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Pasta Primavera",
  "category": [
    {
      "id": 1,
      "name": "Outdoor"
    }
  ],
  "highlights": "Phasellus in felis. Donec semper sapien a libero. Nam dui.",
  "description": "Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
  "couponCode": "AF6385",
  "regularPrice": 209.09,
  "discountPercentage": 77,
  "afterDiscountPrice": 48.0907,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
      "price": 19.38
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.",
      "price": 99.34
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.",
      "price": 54.47
    }
  ],
  "expireDate": "09-Jun-2025",
  "views": 487967,
  "isActive": true
}, {
  "id": 79,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/191x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/102x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/178x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/106x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/190x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Artisan Bread",
  "category": [

  ],
  "highlights": "Duis at velit eu est congue elementum.",
  "description": "Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.",
  "couponCode": "KE6519",
  "regularPrice": 204.9,
  "discountPercentage": 83,
  "afterDiscountPrice": 34.833,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.",
      "price": 11.66
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.",
      "price": 10.68
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.",
      "price": 30.15
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.",
      "price": 34.33
    },
    {
      "id": 5,
      "name": "Quick Start",
      "description": "Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
      "price": 42.06
    }
  ],
  "expireDate": "18-Jun-2025",
  "views": 101867,
  "isActive": false
}, {
  "id": 80,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/194x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/158x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/113x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/153x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Fitness Resistance Bands Kit",
  "category": [
    {
      "id": 1,
      "name": "Food - Prepared Foods"
    },
    {
      "id": 2,
      "name": "Food - Grains"
    }
  ],
  "highlights": "Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.",
  "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
  "couponCode": "AZ6189",
  "regularPrice": 988.01,
  "discountPercentage": 84,
  "afterDiscountPrice": 158.0816,
  "dealPlan": [

  ],
  "expireDate": "09-Aug-2025",
  "views": 424862,
  "isActive": false
}, {
  "id": 81,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/225x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/156x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Beef Jerky",
  "category": [
    {
      "id": 1,
      "name": "Food - Cereal"
    },
    {
      "id": 2,
      "name": "Clothing"
    },
    {
      "id": 3,
      "name": "Clothing - Shirts"
    },
    {
      "id": 4,
      "name": "Home Appliances"
    },
    {
      "id": 5,
      "name": "Food - Dairy"
    }
  ],
  "highlights": "Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.",
  "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
  "couponCode": "SA4293",
  "regularPrice": 392.18,
  "discountPercentage": 4,
  "afterDiscountPrice": 376.4928,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
      "price": 99.79
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.",
      "price": 60.61
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
      "price": 39.77
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.",
      "price": 33.77
    },
    {
      "id": 5,
      "name": "Quick Start",
      "description": "Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.",
      "price": 3.75
    }
  ],
  "expireDate": "17-Mar-2025",
  "views": 627324,
  "isActive": false
}, {
  "id": 82,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/232x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/156x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Pet Travel Carrier",
  "category": [
    {
      "id": 1,
      "name": "Beauty"
    },
    {
      "id": 2,
      "name": "Food - Snacks"
    },
    {
      "id": 3,
      "name": "Food - Bakery"
    }
  ],
  "highlights": "Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
  "description": "Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.",
  "couponCode": "NH4286",
  "regularPrice": 103.12,
  "discountPercentage": 72,
  "afterDiscountPrice": 28.8736,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.",
      "price": 14.58
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
      "price": 52.11
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.",
      "price": 19.31
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Proin eu mi.",
      "price": 87.34
    }
  ],
  "expireDate": "17-Dec-2025",
  "views": 17746,
  "isActive": true
}, {
  "id": 83,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/236x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/185x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/229x100.png/dddddd/000000",
      "isPrimary": false
    }
  ],
  "title": "Pumpkin Spice Muffins",
  "category": [
    {
      "id": 1,
      "name": "Food - Condiments"
    }
  ],
  "highlights": "Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.",
  "description": "In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
  "couponCode": "UA6626",
  "regularPrice": 694.15,
  "discountPercentage": 13,
  "afterDiscountPrice": 603.9105,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.",
      "price": 48.44
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Morbi non lectus.",
      "price": 68.19
    }
  ],
  "expireDate": "01-Oct-2027",
  "views": 764876,
  "isActive": true
}, {
  "id": 84,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/129x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Granola Clusters",
  "category": [
    {
      "id": 1,
      "name": "Food - Condiments"
    },
    {
      "id": 2,
      "name": "Outdoor"
    },
    {
      "id": 3,
      "name": "Photography"
    },
    {
      "id": 4,
      "name": "Accessories"
    }
  ],
  "highlights": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.",
  "description": "Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.",
  "couponCode": "AC9289",
  "regularPrice": 230.28,
  "discountPercentage": 54,
  "afterDiscountPrice": 105.9288,
  "dealPlan": [

  ],
  "expireDate": "24-Jan-2027",
  "views": 466931,
  "isActive": false
}, {
  "id": 85,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/235x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Sea Salt Caramel Brownie",
  "category": [
    {
      "id": 1,
      "name": "Audio"
    },
    {
      "id": 2,
      "name": "Food - Bakery"
    },
    {
      "id": 3,
      "name": "Food - Frozen Meals"
    },
    {
      "id": 4,
      "name": "Home"
    }
  ],
  "highlights": "Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.",
  "description": "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.",
  "couponCode": "BA4267",
  "regularPrice": 802.52,
  "discountPercentage": 26,
  "afterDiscountPrice": 593.8648,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.",
      "price": 95.54
    }
  ],
  "expireDate": "25-Nov-2027",
  "views": 48403,
  "isActive": true
}, {
  "id": 86,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/102x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Cranberry Juice",
  "category": [

  ],
  "highlights": "Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.",
  "description": "Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.",
  "couponCode": "QF3525",
  "regularPrice": 587.95,
  "discountPercentage": 74,
  "afterDiscountPrice": 152.867,
  "dealPlan": [

  ],
  "expireDate": "27-Mar-2025",
  "views": 639088,
  "isActive": false
}, {
  "id": 87,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/202x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/188x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Fitness Smartwatch",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Garden"
    },
    {
      "id": 3,
      "name": "Food - Frozen Foods"
    }
  ],
  "highlights": "Integer a nibh.",
  "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.",
  "couponCode": "LH5151",
  "regularPrice": 550.08,
  "discountPercentage": 22,
  "afterDiscountPrice": 429.0624,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.",
      "price": 75.71
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.",
      "price": 97.87
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.",
      "price": 40.09
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.",
      "price": 7.32
    },
    {
      "id": 5,
      "name": "Premium",
      "description": "In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.",
      "price": 60.85
    }
  ],
  "expireDate": "17-Nov-2026",
  "views": 734189,
  "isActive": false
}, {
  "id": 88,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/246x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/118x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Quality Chef Apron",
  "category": [
    {
      "id": 1,
      "name": "Home"
    },
    {
      "id": 2,
      "name": "Food - Frozen Foods"
    }
  ],
  "highlights": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.",
  "description": "Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.",
  "couponCode": "AF8413",
  "regularPrice": 547.42,
  "discountPercentage": 80,
  "afterDiscountPrice": 109.484,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.",
      "price": 36.36
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.",
      "price": 9.96
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.",
      "price": 37.75
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.",
      "price": 95.8
    }
  ],
  "expireDate": "12-Jul-2025",
  "views": 559513,
  "isActive": false
}, {
  "id": 89,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/214x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/161x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/116x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/250x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Bluetooth Sleep Headphones",
  "category": [
    {
      "id": 1,
      "name": "Kitchen"
    },
    {
      "id": 2,
      "name": "Clothing - Accessories"
    },
    {
      "id": 3,
      "name": "Food - Snacks"
    },
    {
      "id": 4,
      "name": "Outdoor"
    }
  ],
  "highlights": "Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.",
  "description": "Fusce consequat. Nulla nisl. Nunc nisl.",
  "couponCode": "QF8236",
  "regularPrice": 440.18,
  "discountPercentage": 5,
  "afterDiscountPrice": 418.171,
  "dealPlan": [

  ],
  "expireDate": "13-Sep-2027",
  "views": 733670,
  "isActive": false
}, {
  "id": 90,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/136x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/179x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/157x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Window Bird Feeder",
  "category": [

  ],
  "highlights": "In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.",
  "couponCode": "TG4162",
  "regularPrice": 786.89,
  "discountPercentage": 85,
  "afterDiscountPrice": 118.0335,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
      "price": 93.44
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.",
      "price": 28.62
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.",
      "price": 7.43
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
      "price": 51.74
    }
  ],
  "expireDate": "16-Jun-2026",
  "views": 833081,
  "isActive": false
}, {
  "id": 91,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/143x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Pet Caress Brush",
  "category": [
    {
      "id": 1,
      "name": "Clothing - Footwear"
    },
    {
      "id": 2,
      "name": "Food"
    },
    {
      "id": 3,
      "name": "Kitchen"
    }
  ],
  "highlights": "Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.",
  "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.",
  "couponCode": "TG3912",
  "regularPrice": 285.29,
  "discountPercentage": 38,
  "afterDiscountPrice": 176.8798,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.",
      "price": 84.09
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.",
      "price": 75.81
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.",
      "price": 76.85
    },
    {
      "id": 4,
      "name": "Quick Start",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
      "price": 12.11
    }
  ],
  "expireDate": "02-Jan-2025",
  "views": 527237,
  "isActive": false
}, {
  "id": 92,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/216x100.png/dddddd/000000",
      "isPrimary": true
    }
  ],
  "title": "Pet Nail Clipper",
  "category": [
    {
      "id": 1,
      "name": "Food - Baking Goods"
    },
    {
      "id": 2,
      "name": "Garden"
    },
    {
      "id": 3,
      "name": "Food - Bakery"
    },
    {
      "id": 4,
      "name": "Electronics"
    },
    {
      "id": 5,
      "name": "Office"
    }
  ],
  "highlights": "In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.",
  "description": "Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.",
  "couponCode": "NH2293",
  "regularPrice": 590.72,
  "discountPercentage": 22,
  "afterDiscountPrice": 460.7616,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.",
      "price": 96.98
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
      "price": 87.4
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.",
      "price": 6.5
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.",
      "price": 43.49
    }
  ],
  "expireDate": "23-May-2027",
  "views": 155239,
  "isActive": false
}, {
  "id": 93,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/245x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Portable Grill Cover",
  "category": [

  ],
  "highlights": "Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
  "description": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.",
  "couponCode": "AC5532",
  "regularPrice": 970.78,
  "discountPercentage": 8,
  "afterDiscountPrice": 893.1176,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Etiam pretium iaculis justo. In hac habitasse platea dictumst.",
      "price": 2.29
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.",
      "price": 54.63
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
      "price": 43.95
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.",
      "price": 16.83
    }
  ],
  "expireDate": "22-Jun-2027",
  "views": 204380,
  "isActive": true
}, {
  "id": 94,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/175x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/226x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/222x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/151x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/158x100.png/5fa2dd/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Outdoor Adventure Backpack",
  "category": [
    {
      "id": 1,
      "name": "Food - Seafood"
    },
    {
      "id": 2,
      "name": "Home"
    }
  ],
  "highlights": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.",
  "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "couponCode": "NZ7965",
  "regularPrice": 315.69,
  "discountPercentage": 29,
  "afterDiscountPrice": 224.1399,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.",
      "price": 5.32
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Nam tristique tortor eu pede.",
      "price": 1.84
    },
    {
      "id": 3,
      "name": "Standard",
      "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.",
      "price": 57.43
    },
    {
      "id": 4,
      "name": "Premium",
      "description": "Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.",
      "price": 30.79
    }
  ],
  "expireDate": "05-Dec-2026",
  "views": 143920,
  "isActive": true
}, {
  "id": 95,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/232x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/111x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/153x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/119x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/121x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Classic White T-Shirt",
  "category": [
    {
      "id": 1,
      "name": "Food - Dairy"
    },
    {
      "id": 2,
      "name": "Pets"
    },
    {
      "id": 3,
      "name": "Food - Dairy"
    },
    {
      "id": 4,
      "name": "Accessories"
    },
    {
      "id": 5,
      "name": "Food - Spices"
    }
  ],
  "highlights": "Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.",
  "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.",
  "couponCode": "AZ1940",
  "regularPrice": 357.18,
  "discountPercentage": 61,
  "afterDiscountPrice": 139.3002,
  "dealPlan": [

  ],
  "expireDate": "02-Nov-2026",
  "views": 34336,
  "isActive": true
}, {
  "id": 96,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/234x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/122x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/113x100.png/ff4444/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/230x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/148x100.png/ff4444/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Maple Glazed Carrots",
  "category": [

  ],
  "highlights": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.",
  "description": "Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\n\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.",
  "couponCode": "AF3537",
  "regularPrice": 718.49,
  "discountPercentage": 68,
  "afterDiscountPrice": 229.9168,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.",
      "price": 21.08
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "Morbi a ipsum. Integer a nibh.",
      "price": 22.43
    }
  ],
  "expireDate": "02-Jun-2026",
  "views": 624965,
  "isActive": true
}, {
  "id": 97,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/167x100.png/ff4444/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Sliced Cucumbers",
  "category": [
    {
      "id": 1,
      "name": "Fitness"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Accessories"
    }
  ],
  "highlights": "Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.",
  "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
  "couponCode": "AI6017",
  "regularPrice": 322.1,
  "discountPercentage": 32,
  "afterDiscountPrice": 219.028,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      "price": 68.92
    },
    {
      "id": 2,
      "name": "Standard",
      "description": "In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
      "price": 73.15
    },
    {
      "id": 3,
      "name": "Premium",
      "description": "Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.",
      "price": 95.29
    },
    {
      "id": 4,
      "name": "Standard",
      "description": "Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.",
      "price": 99.61
    },
    {
      "id": 5,
      "name": "Quick Start",
      "description": "Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.",
      "price": 79.75
    }
  ],
  "expireDate": "24-Jan-2027",
  "views": 772014,
  "isActive": false
}, {
  "id": 98,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/149x100.png/dddddd/000000",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/186x100.png/5fa2dd/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/124x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/158x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Incense Holder",
  "category": [
    {
      "id": 1,
      "name": "Clothing - Outerwear"
    },
    {
      "id": 2,
      "name": "Kitchen"
    },
    {
      "id": 3,
      "name": "Food - Soups"
    },
    {
      "id": 4,
      "name": "Clothing - Dresses"
    }
  ],
  "highlights": "Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.",
  "description": "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
  "couponCode": "SK5810",
  "regularPrice": 350.63,
  "discountPercentage": 11,
  "afterDiscountPrice": 312.0607,
  "dealPlan": [
    {
      "id": 1,
      "name": "Quick Start",
      "description": "Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.",
      "price": 25.05
    },
    {
      "id": 2,
      "name": "Premium",
      "description": "Morbi a ipsum.",
      "price": 95.92
    }
  ],
  "expireDate": "03-Mar-2027",
  "views": 157800,
  "isActive": false
}, {
  "id": 99,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/124x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/146x100.png/5fa2dd/ffffff",
      "isPrimary": true
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/217x100.png/cc0000/ffffff",
      "isPrimary": true
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/236x100.png/cc0000/ffffff",
      "isPrimary": false
    },
    {
      "id": 5,
      "imageUrl": "http://dummyimage.com/159x100.png/5fa2dd/ffffff",
      "isPrimary": false
    }
  ],
  "title": "Teriyaki Tofu Stir-Fry",
  "category": [
    {
      "id": 1,
      "name": "Accessories"
    },
    {
      "id": 2,
      "name": "Fitness"
    },
    {
      "id": 3,
      "name": "Food - Frozen Food"
    },
    {
      "id": 4,
      "name": "Home"
    }
  ],
  "highlights": "Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.",
  "description": "Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
  "couponCode": "NZ3511",
  "regularPrice": 705.68,
  "discountPercentage": 45,
  "afterDiscountPrice": 388.124,
  "dealPlan": [
    {
      "id": 1,
      "name": "Premium",
      "description": "Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.",
      "price": 42.48
    }
  ],
  "expireDate": "11-Jun-2027",
  "views": 467236,
  "isActive": true
}, {
  "id": 100,
  "media": [
    {
      "id": 1,
      "imageUrl": "http://dummyimage.com/140x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 2,
      "imageUrl": "http://dummyimage.com/172x100.png/ff4444/ffffff",
      "isPrimary": false
    },
    {
      "id": 3,
      "imageUrl": "http://dummyimage.com/125x100.png/dddddd/000000",
      "isPrimary": false
    },
    {
      "id": 4,
      "imageUrl": "http://dummyimage.com/209x100.png/cc0000/ffffff",
      "isPrimary": true
    }
  ],
  "title": "Electric Griddle with Removable Plates",
  "category": [
    {
      "id": 1,
      "name": "Garden"
    },
    {
      "id": 2,
      "name": "Accessories"
    },
    {
      "id": 3,
      "name": "Home"
    },
    {
      "id": 4,
      "name": "Food - Sauces"
    }
  ],
  "highlights": "Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.",
  "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
  "couponCode": "TG3919",
  "regularPrice": 605.79,
  "discountPercentage": 39,
  "afterDiscountPrice": 369.5319,
  "dealPlan": [
    {
      "id": 1,
      "name": "Standard",
      "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.",
      "price": 40.49
    },
    {
      "id": 2,
      "name": "Quick Start",
      "description": "Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.",
      "price": 67.91
    },
    {
      "id": 3,
      "name": "Quick Start",
      "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
      "price": 13.23
    }
  ],
  "expireDate": "22-Dec-2025",
  "views": 349850,
  "isActive": false
}]
''';
