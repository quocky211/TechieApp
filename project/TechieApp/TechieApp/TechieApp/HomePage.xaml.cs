﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TechieApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class HomePage : ContentPage
    {
        private int tapCount = 0;
        public static List<Product> ProductLists;
        public void AddSlideImage()
        {
            List<SlideImage> slideImages = new List<SlideImage>();
            slideImages.Add(new SlideImage { SlideImg = "slider1.jpg" });
            slideImages.Add(new SlideImage { SlideImg = "slider2.jpg" });
            slideImages.Add(new SlideImage { SlideImg = "slider3.jpg" });
            slideImages.Add(new SlideImage { SlideImg = "slider4.webp" });
            slideImages.Add(new SlideImage { SlideImg = "slider5.png" });
            Device.StartTimer(TimeSpan.FromSeconds(5), (Func<bool>)(() =>
            {
                banner.Position = (banner.Position + 1) % slideImages.Count;
                return true;
            }));
            banner.ItemsSource = slideImages;
        }
        public async void ListProductAPI()
        {
            HttpClient http = new HttpClient();
            var kq = await http.GetStringAsync("http://192.168.1.26/TechieAPI/api/product/ListProduct");
            var dsproduct = JsonConvert.DeserializeObject<List<Product>>(kq);
            ProductLists = dsproduct;
            Lstproducts.ItemsSource = dsproduct;
        }
        public HomePage()
        {
            InitializeComponent();
            AddSlideImage();
            ListProductAPI();
        }

        private void ImgAddToWishList_Tapped(object sender, EventArgs e)
        {
            tapCount++;
            var imgSource = (Image)sender;
            if (tapCount % 2 == 0)
            {
                imgSource.Source = "FavouriteRedIcon.png";
            }
            else
            {
                imgSource.Source = "FavouriteBlackIcon.png";
            }

        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            Lstproducts.ItemsSource = ProductLists.Where(Product => Product.name.ToLower().Contains(e.NewTextValue));
        }

        private void Lstproducts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Product selectedProduct = (Product)Lstproducts.SelectedItem;
            Navigation.PushAsync(new ProductDetailPage(selectedProduct));
        }
    }
}