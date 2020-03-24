<?php


namespace Application\Controller;


use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class ProductController extends AbstractActionController
{
    public function indexAction()
    {
        $products = array(
            [
                'id' => 156555,
                'name' => 'Combo 1',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1500
            ],
            [
                'id' => 156556,
                'name' => 'Combo 2',
                'img' => 'https://source.unsplash.com/random',
                'price' => 15000
            ],
            [
                'id' => 654321,
                'name' => 'Combo 3',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1600
            ],
            [
                'id' => 567567,
                'name' => 'Combo 4',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1500
            ],
            [
                'id' => 879789,
                'name' => 'Combo 5',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1500
            ],
            [
                'id' => 987666,
                'name' => 'Combo 6',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1500
            ],
            [
                'id' => 156535,
                'name' => 'Combo 7',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1500
            ],
            [
                'id' => 156545,
                'name' => 'Combo 8',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1500
            ],
            [
                'id' => 156595,
                'name' => 'Combo 9',
                'img' => 'https://source.unsplash.com/random',
                'price' => 1500
            ]
        );

        $this->layout("layout/product");
        return new ViewModel(array(
            "products" => $products
        ));
    }
}