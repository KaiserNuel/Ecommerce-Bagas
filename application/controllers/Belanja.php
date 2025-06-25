<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Belanja extends CI_Controller {

    // Load Model
    public function __construct()
    {
        parent::__construct();
        $this->load->model('produk_model');
        $this->load->model('kategori_model');
        $this->load->model('konfigurasi_model');
        $this->load->model('pelanggan_model');
        $this->load->model('header_transaksi_model');
        $this->load->model('transaksi_model');
        $this->load->model('rekening_model');
        $this->load->helper('string');
    }

    // Halaman belanja - HARUS LOGIN
    public function index()
    {
        // Cek login
        if (!$this->session->userdata('email')) {
            $this->session->set_flashdata('warning', 'Silahkan login atau registrasi terlebih dahulu');
            redirect('registrasi');
        }

        $keranjang = $this->cart->contents();

        $data = array(
            'title' => 'Keranjang Belanja',
            'keranjang' => $keranjang,
            'isi' => 'belanja/list' 
        );
        $this->load->view('layout/wrapper', $data, FALSE);
    }

    // Sukses belanja
    public function sukses()
    {
        $konfigurasi = $this->konfigurasi_model->listing();
        $data_rekening_pembayaran = $this->rekening_model->listing();

        $data = array(
            'title' => 'Pemesanan Berhasil.',
            'konfigurasi' => $konfigurasi,
            'data_rekening_pembayaran' => $data_rekening_pembayaran,
            'isi' => 'belanja/sukses' 
        );
        $this->load->view('layout/wrapper', $data, FALSE);
    }

    // Checkout - HARUS LOGIN
    public function checkout()
    {
        // Cek login
        if (!$this->session->userdata('email')) {
            $this->session->set_flashdata('warning', 'Silahkan login atau registrasi terlebih dahulu');
            redirect('registrasi');
        }

        $email = $this->session->userdata('email');
        $pelanggan = $this->pelanggan_model->sudah_login($email);
        $keranjang = $this->cart->contents();

        // Validasi input
        $valid = $this->form_validation;
        
        $valid->set_rules('nama_pelanggan','Nama lengkap','required',
            array('required' => '%s harus diisi'));

        $valid->set_rules('telepon','Nomor telepon','required',
            array('required' => '%s harus diisi'));

        $valid->set_rules('alamat','Alamat','required',
            array('required' => '%s harus diisi'));

        $valid->set_rules('email','Email','required|valid_email',
            array(
                'required' => '%s harus diisi',
                'valid_email' => '%s tidak valid'
            ));

        if ($valid->run() === FALSE) {
            // Tampilkan form jika validasi gagal
            $data = array(
                'title' => 'Checkout',
                'keranjang' => $keranjang,
                'pelanggan' => $pelanggan,
                'isi' => 'belanja/checkout' 
            );
            $this->load->view('layout/wrapper', $data, FALSE);
        } else {
            // Proses checkout
            $i = $this->input;
            $data = array(
                'id_pelanggan' => $pelanggan->id_pelanggan,
                'nama_pelanggan' => $i->post('nama_pelanggan'),
                'email' => $i->post('email'),
                'telepon' => $i->post('telepon'),
                'alamat' => $i->post('alamat'),
                'kode_transaksi' => $i->post('kode_transaksi'),
                'tanggal_transaksi' => $i->post('tanggal_transaksi'),
                'jumlah_transaksi' => $i->post('jumlah_transaksi'),
                'status_bayar' => 'Belum',
                'tanggal_post' => date('Y-m-d H:i:s')
            );
            
            // Simpan header transaksi
            $this->header_transaksi_model->tambah($data);

            // Simpan detail transaksi
            foreach ($keranjang as $item) {
                $sub_total = $item['price'] * $item['qty'];

                $data = array(
                    'id_pelanggan' => $pelanggan->id_pelanggan,
                    'kode_transaksi' => $i->post('kode_transaksi'),
                    'id_produk' => $item['id'],
                    'harga' => $item['price'],
                    'jumlah' => $item['qty'],
                    'total_harga' => $sub_total,
                    'tanggal_transaksi' => $i->post('tanggal_transaksi')
                );
                $this->transaksi_model->tambah($data);
            }

            // Kosongkan keranjang
            $this->cart->destroy();
            $this->session->set_flashdata('sukses','Checkout berhasil');
            redirect(base_url('belanja/sukses'));
        }
    }

    // Tambahkan ke keranjang - HARUS LOGIN
    public function add()
    {
        // Cek login
        if (!$this->session->userdata('email')) {
            $this->session->set_flashdata('warning', 'Silahkan login atau registrasi terlebih dahulu');
            redirect('registrasi');
        }

        // Ambil data dari form
        $id = $this->input->post('id');
        $qty = $this->input->post('qty', 1); // Default 1 jika tidak ada input
        $price = $this->input->post('price');
        $name = $this->input->post('name');
        $redirect_page = $this->input->post('redirect_page');

        // Validasi produk dan stok
        $produk = $this->produk_model->detail($id);
        if (!$produk) {
            $this->session->set_flashdata('warning', 'Produk tidak ditemukan');
            redirect($redirect_page);
        }

        if ($qty > $produk->stok) {
            $this->session->set_flashdata('warning', 'Jumlah melebihi stok yang tersedia');
            redirect($redirect_page);
        }

        // Memasukkan ke keranjang belanja
        $data = array(
            'id' => $id,
            'qty' => $qty,
            'price' => $price,
            'name' => $name
        );
        $this->cart->insert($data);
        redirect($redirect_page);
    }

    // Update cart - HARUS LOGIN
    public function update_cart($rowid)
    {
        // Cek login
        if (!$this->session->userdata('email')) {
            $this->session->set_flashdata('warning', 'Silahkan login atau registrasi terlebih dahulu');
            redirect('registrasi');
        }

        if ($rowid) {
            $new_qty = $this->input->post('qty');
            
            // Validasi stok
            $item = $this->cart->get_item($rowid);
            $produk = $this->produk_model->detail($item['id']);
            
            if ($new_qty > $produk->stok) {
                $this->session->set_flashdata('warning', 'Jumlah melebihi stok yang tersedia');
                redirect(base_url('belanja'));
            }

            $data = array(
                'rowid' => $rowid,
                'qty' => $new_qty
            );
            $this->cart->update($data);
            $this->session->set_flashdata('sukses', 'Data Keranjang Telah Diupdate');
        }
        redirect(base_url('belanja'));
    }

    // Hapus item - HARUS LOGIN
    public function hapus($rowid)
    {
        // Cek login
        if (!$this->session->userdata('email')) {
            $this->session->set_flashdata('warning', 'Silahkan login atau registrasi terlebih dahulu');
            redirect('registrasi');
        }

        if ($rowid) {
            $this->cart->remove($rowid);
            $this->session->set_flashdata('sukses', 'Data telah dihapus');
        }
        redirect(base_url('belanja'));
    }
}

/* End of file Belanja.php */
/* Location: ./application/controllers/Belanja.php */